filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.
 
" Add recently accessed projects menu (project plugin)
 set viminfo^=!
  
  " Minibuffer Explorer Settings
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapCTabSwitchBufs = 1
  let g:miniBufExplModSelTarget = 1
   
   " alt+n or alt+p to navigate between entries in QuickFix
   map <silent> <m-p> :cp <cr>
   map <silent> <m-n> :cn <cr>
   map <C-t> :FuzzyFinderTextMate<cr>

"                 MBENormal         - for buffers that have NOT CHANGED and
"                                     are NOT VISIBLE.
"                 MBEChanged        - for buffers that HAVE CHANGED and are
"                                     NOT VISIBLE
"                 MBEVisibleNormal  - buffers that have NOT CHANGED and are
"                                     VISIBLE
"                 MBEVisibleChanged - buffers that have CHANGED and are VISIBLE
"
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
syntax enable
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
"colorscheme textmate16  " Uncomment this to set a default theme
 set term=xterm-256color

"	highlight MBENormal ctermfg=White ctermbg=NONE
"	highlight MBEVisibleChanged ctermfg=White ctermbg=NONE
"	highlight MBEVisibleNormal ctermfg=White ctermbg=NONE
  " Formatting (some of these are for coding in C and C++)
  set ts=2  " Tabs are 2 spaces
  set bs=2  " Backspace over everything in insert mode
  set shiftwidth=2  " Tabs under smart indent
  set nocp incsearch
  set cinoptions=:0,p0,t0
  set cinwords=if,else,while,do,for,switch,case
  set formatoptions=tcqr
  set cindent
  set autoindent
  set smarttab
  set expandtab
   
   " Visual
   set showmatch  " Show matching brackets.
   set mat=5  " Bracket blinking.
   "set list
   " Show $ at end of line and trailing space as ~
   set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
   set novisualbell  " No blinking .
   set noerrorbells  " No noise.
   set laststatus=2  " Always show status line.
    
    " gvim specific
    set mousehide  " Hide mouse after chars typed
    set mouse=a  " Mouse in all modes
au! BufRead,BufNewFile *.haml  setfiletype haml
au BufRead,BufNewFile *.haml set sw=2 sts=2 et

"{{{ Ruby block delimiter conversion: do end <=> { }
"Copyright Š 2005 Mauricio Fernandez
"Subject to same licensing terms as Ruby.
" requires matchit and friends 
" since it uses the % and = bindings
function! s:String_Strip(str)
    let s = substitute(a:str, '\v^\s*', '', '')
    return substitute(s, '\v\s*$', '', '')
endfunction

function! s:RubyBlockBraceToDoEnd(lineno)
    " { } => do end
    let oldz = getreg("z")
    call setreg("z", "")
    execute 'normal ^f{%l"zd$'
    let suffix = s:String_Strip(getreg("z"))
    call setreg("z", oldz)
    let orig = getline(".")
    let repl = substitute(orig, '\v\s*\{\s*(\|[^|]*\|)?.*', ' do \1', '')
    call setline(".", repl)
    let nextline = substitute(orig, '\v[^{]*\v\s*\{\s*(\|[^|]*\|)?', '', '')
    let nextline = substitute(nextline, '\}[^}]*$', '', '')
    let numlines = 0
    

    " uncomment one of the following:
    
    " (1) just insert the body without splitting the lines on ;
    "call append(a:lineno, nextline)
    "call append(a:lineno+1, 'end' . suffix)
    "
    
    " (2) try to split on ; ...
    call append(a:lineno, 'end' . suffix)
    " this is what we would want to do: 
    "let nextline = substitute(nextline, ';', "\n", 'g')
    
    while stridx(nextline, ";") != -1
	let eom = stridx(nextline, ";")
	let line = s:String_Strip(strpart(nextline, 0, eom))
	call append(a:lineno + numlines, line) 
	let numlines = numlines + 1
	let nextline = strpart(nextline, eom+1, strlen(nextline) - eom - 1)
    endwhile
    let nextline = s:String_Strip(nextline)
    if strlen(nextline) > 0
	call append(a:lineno + numlines, nextline)
	let numlines = numlines + 1
    endif

    " this is what it all began with...
    "execute 'normal :s/\v\s*\{\s*(\|.*\|)?/ do \1\r/
'
    "execute 'normal g_cw
end'
    execute 'normal V' . (1 + numlines) . 'j='
    "echo "{ } => do end"
endfunction

function! s:RubyBlockDoEndToBrace(_firstline, _lastline)
    " do end => { }
    let linenum = a:_firstline + 1
    let orig = getline(".")
    while linenum < a:_lastline - 1
	let addline = getline(linenum)
	if '\v^\s*$' !~ addline
	    let addline = substitute(addline, '\v^\s*', '', '')
	    let addline = substitute(addline, '\s*$', '; ', '')
	    let orig = orig . addline
	endif
	let linenum = linenum + 1
    endwhile
    let l = substitute(getline(a:_lastline-1), '\v^\s*', '', '')
    let l = substitute(l, '\s*$', '', '')
    let orig = orig . l
    let l = substitute(getline(a:_lastline), '\v^\s*end(\.|\s|$)@=', ' }', '')
    let l = substitute(l, '\s*$', '', '')
    let orig = orig . l
    
    "echo orig
    "input(orig)
    let repl = substitute(orig, '\v\s*do\s*(\|[^|]*\|)?', '{\1 ', '')
    "execute 'normal d' . (a:_lastline - a:_firstline) . 'j'
    execute ':' . a:_firstline . ',' . a:_lastline . 'd'
    call append(a:_firstline - 1, repl)
    execute ':' . a:_firstline
    "echo "do end => { }"
endfunction

map <SID>xx <SID>xx
let s:sid = maparg("<SID>xx")
unmap <SID>xx
let s:sid = substitute(s:sid, 'xx', '', '')

function! <SID>RubyBlockSwitchDelimiters() range
    set nofoldenable
    if a:firstline == a:lastline
	let braceidx = match(getline("."), '{')
	let doidx = match(getline("."), '\<do\>')
	if braceidx != -1 && (doidx == -1 || braceidx < doidx)
	    call s:RubyBlockBraceToDoEnd(a:firstline)
	elseif doidx != -1
	    execute 'normal /\<do\>' . "\n" . 'V%:call ' . 
			\ s:sid . 'RubyBlockSwitchDelimiters()' . "\n"
	else
	    echo "No block found"
	end
    else
	call s:RubyBlockDoEndToBrace(a:firstline, a:lastline)
    endif
    "execute 'normal V2k='
    "execute 'normal v5j'
endfunction

command! -range B <line1>,<line2>call <SID>RubyBlockSwitchDelimiters()
vmap <Leader>B :call <SID>RubyBlockSwitchDelimiters()<cr>
set wildignore+=test/ruby/1.8/**

call pathogen#runtime_append_all_bundles()
filetype plugin indent on
