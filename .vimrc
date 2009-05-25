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
colorscheme textmate16  " Uncomment this to set a default theme
 set term=xterm-256color

	highlight MBENormal ctermfg=White ctermbg=NONE
	highlight MBEVisibleChanged ctermfg=White ctermbg=NONE
	highlight MBEVisibleNormal ctermfg=White ctermbg=NONE
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
