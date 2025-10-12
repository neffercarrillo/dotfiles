syntax on
set noswapfile
set nocompatible
set autoindent
set ruler
set incsearch
set nolist
set tabstop=4
set shiftwidth=4
set showmatch
set number
set modeline

" Handle F3 in normal mode
nnoremap <F3> :w<CR>i

" Handle F3 in insert mode
inoremap <F3> <C-o>:w<CR>
