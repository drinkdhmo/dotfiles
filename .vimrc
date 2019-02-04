" Turn of compatibility with legacy vi
set nocompatible
" Always display the status line, even if only one window is displayed
set laststatus=2
set encoding=utf-8
filetype off
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
set completeopt-=preview

set lazyredraw

filetype plugin indent on
filetype plugin on
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
" colorscheme molokai
set background=dark

let mapleader = "\\"
nmap <space> <leader>
vmap <space> <leader>
set backspace=indent,eol,start

" Escape Mappings for insert and visual modes
inoremap jk <esc>
vnoremap jk <esc>

" Mappings to edit .vimrc and source/save .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Mappings to move between panes
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" Mapping for jumping
nnoremap <S-Tab> <C-O>

" Mappings to go to the end of line and beginning of line
nnoremap L $
vnoremap L $
nnoremap H 0
vnoremap H 0

" Mappings to move up and down faster
nnoremap J 10j
vnoremap J 10j
nnoremap K 10k
vnoremap K 10k
