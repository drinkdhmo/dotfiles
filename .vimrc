" Vim .vimrc
" author: Devon Morris
" contact: devonmorris1992@gmail.com
" date: Oct 26 2018

"""""""""""""" Plugins """""""""""""""""""
" Install vim-plug automatically if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" Typing and Syntax/Linting
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdcommenter'

" Git Integration
Plug 'airblade/vim-gitgutter'

" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Sytle
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

call plug#end()

"""""""""""" General Configuration """"""""""""""

" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set nocompatible              " be improved, required
set encoding=utf-8
set lazyredraw
set number

set completeopt=menu

filetype plugin indent on    " required
filetype plugin on
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
colorscheme molokai
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

" Mappings for Git (vim-fugitive and git-gutter)
nmap <leader>ga <Plug>GitGutterStageHunk
nmap <leader>gd <Plug>GitGutterPreviewHunk
nmap <leader>gu <Plug>GitGutterUndoHunk
nmap <leader>gj <Plug>GitGutterNextHunk
nmap <leader>gk <Plug>GitGutterPrevHunk


" Mappings to go to end of line and beginning of line
nnoremap L $
vnoremap L $
nnoremap H 0
vnoremap H 0

" Mappings to move up and down faster
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k

" Mappings for tree list netrw
nnoremap <leader>ex :Vex <CR>
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_liststyle = 3

autocmd FileType make set noexpandtab softtabstop=0

augroup cpp
	autocmd!
  set tabstop=2
  set shiftwidth=2
augroup END

augroup py
	autocmd!
  set tabstop=4
  set shiftwidth=4
augroup END

""""""""""""""""" Plugin Configuration """""""""""""
"" ALE
" Use LSP linters
" To use clang, make sure to install clang and update alternatives 
" https://askubuntu.com/questions/970640/trying-to-install-atom-unable-to-start-clangd-language-server
" Is a good resource, but this needs to be done for each linter
let g:ale_linters = {'cpp': ['clang', 'clangd', 'clangcheck', 'clangtidy', 'clang-format'], 'python':['pyls'], 'cmake': ['cmakelint']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'
let g:ale_c_parse_compile_commands=1
let g:ale_cpp_clangtidy_checks = ['modernize', 'google', 'clang-analyzer', 'performance', 'readability', 'bugprone']

" Use Ale to jump to definition, etc.
nnoremap <leader>info :ALEHover<CR>
nnoremap <c-]>  :ALEGoToDefinition<CR>
nnoremap <leader>ref :ALEFindReferences<CR>

" Show ale errors in airline status bar
let g:airline#extensions#ale#enabled = 1

" This is for airline and powerline
" Note: If symbols don't appear install them with
" `sudo apt install fonts-powerline` Ubuntu
let g:airline_powerline_fonts = 1

" Trigger configuration for ultisnips. 
let g:UltiSnipsSnippetDirectories=["/home/devon/.vim/UltiSnips", "~/.vim/plugged/vim-snippets/UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Don't override background
hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE
" But let pop upmenu override background so you can tell it's a popup
highlight Pmenu ctermbg=darkgray guibg=darkgray

" FZF
" leader + f to search files
" Ctrl+t, Ctrl+x, Ctrl+v to open in tab, split, vsplit
nnoremap <leader>f :Files<CR>
" leader + s (for UltiSnips) to insert a snippet
nnoremap <leader>s :Snippets<CR>

" Make vimtex use xelatex
let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
