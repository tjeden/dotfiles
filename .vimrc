set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Plugins here:

" Rails
Plugin 'tpope/vim-rails'
" Gemfile syntax
Plugin 'hron84/Gemfile.vim'
" Minifbuffer at top
" Plugin 'minibufexpl.vim'
" Rdoc syntax highltight
Plugin 'RDoc'
" Wordpress plugin
" Plugin 'blogit.vim'
" Command-T like plugin
Plugin 'ctrlp.vim'
" Ack for search
Plugin 'ack.vim'
" Syntax for nginx config files
Plugin 'nginx.vim'
" Syntax for coffe script
Plugin 'kchmck/vim-coffee-script'
" Syntax for jade
Plugin 'jade.vim'
" Surroudings
Plugin 'surround.vim'
" grep.vim
Plugin 'grep.vim'
" less.vim
Plugin 'groenewege/vim-less'
" wisely add end in ruby
Plugin 'endwise.vim'
" Golang
Plugin 'fatih/vim-go'
" Haml
Plugin 'tpope/vim-haml'
" Emblem
Plugin 'heartsentwined/vim-emblem'
" Mustache Handlebars
Plugin 'mustache/vim-mustache-handlebars'
" Javascript formatting
Plugin 'maksimr/vim-jsbeautify'
" CSS colors
Plugin 'ap/vim-css-color'

call vundle#end()             " required
filetype plugin indent on     " required! 

"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
 
set ruler                   " Ruler on
set nu                      " Line numbers on
set nowrap                  " Line wrapping off
set timeoutlen=250          " Time to wait after ESC (default causes an annoying delay)
set term=xterm-256color

set ts=2                    " Tabs are 2 spaces
set bs=2                    " Backspace over everything in insert mode
set tabstop=2 shiftwidth=2  " Tabs under smart indent
set expandtab               " use spaces, not tabs
set smarttab
 
set showmatch               " Show matching brackets.
set mat=5                   " Bracket blinking.
set novisualbell            " No blinking .
set noerrorbells            " No noise.
set laststatus=2            " Always show status line.

set nocp incsearch          
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent


set clipboard=unnamed       " Nice copy pasting

set hlsearch                " highlighting
:nnoremap <CR> :nohlsearch<cr>  " clear the search buffer when hitting return

syntax on                   " Colors in OSX
" TEX files set wrap
:autocmd BufNewFile,BufRead *.tex set wrap
" HTML files set wrap
:autocmd BufNewFile,BufRead *.html set wrap
" TXT files set wrap
:autocmd BufNewFile,BufRead *.txt set wrap
    
let g:ctrlp_map = '<c-t>'

" Json syntax
autocmd BufNewFile,BufRead *.json set ft=javascript

" autosave and return to normal mode
autocmd FocusLost * :silent! wall
autocmd FocusLost * call feedkeys("\<C-\>\<C-n>")

" Autocorections
iab Factroy Factory
iab descrbie describe
iab Documass Documas
iab defintion definition
iab Defintion Definition
iab destory destroy

" Go lang
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.hamlbars set filetype=haml 
au BufRead,BufNewFile *.txt set wrap
au BufRead,BufNewFile *.tex set wrap

" Format JS
autocmd FileType javascript noremap <buffer>  <c-f> :call RangeJsBeautify()<cr>

" Open netrw preview in vertical split
let g:netrw_preview = 1

" Press F5 inside i, and paste code with comments
set pastetoggle=<f5>

" k and j works in wrap mode
nnoremap k gk
nnoremap j gj

" Ag for ACK
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
