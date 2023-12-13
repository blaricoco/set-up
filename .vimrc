" Text
set display+=lastline
set encoding=utf-8
set linebreak
set wrap
set number
set title

" User Interface
set visualbell
set wrap
set number
set title

" Indentation
set autoindent
set expandtab
set noshiftround
set shiftwidth=4
set smarttab
set tabstop=4
set softtabstop=4

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

" Mapping
nmap <Leader>l :<C-w>l
nmap <Leader>h :<C-w>h
let mapleader = "\<space>"
let g:netrw_altv=1
let g:netrw_winsize = 30
nmap <Leader>t :Vexplore<CR>


" General
syntax on
set nocompatible
