call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
    " telescope dependecy
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'airblade/vim-gitgutter' 
    Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

lua require'colorizer'.setup()
