set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:

" Rails
Bundle 'tpope/vim-rails'
" Slim
Bundle 'bbommarito/vim-slim'
" Gemfile syntax
Bundle 'hron84/Gemfile.vim'
" Minifbuffer at top
" Bundle 'minibufexpl.vim'
" Rdoc syntax highltight
Bundle 'RDoc'
" Wordpress plugin
Bundle 'blogit.vim'
" Command-T like plugin
Bundle 'ctrlp.vim'
" Ack for search
Bundle 'ack.vim'
" Syntax for nginx config files
Bundle 'nginx.vim'
" Syntax for coffe script
Bundle 'vim-coffee-script'
" Syntax fo jade
Bundle 'jade.vim'

filetype plugin indent on     " required! 

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
 
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

