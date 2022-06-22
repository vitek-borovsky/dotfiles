set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" cursor
set guicursor=
set nohlsearch
set noerrorbells
set nowrap
set noswapfile
" lets you :q even when you should :wq or q! leaves it open in background
"set hidden
set scrolloff=8
set signcolumn=yes

" for colorizer
set termguicolors

" get undotree fro E editor"
"set undodir=~]/.vim/undodir
"undofile

source $HOME/.config/nvim/vim-plug/plugins.vim
