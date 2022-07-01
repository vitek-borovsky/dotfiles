return require('packer').startup(function()
    -- packeritself
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- telescope dependecy
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'airblade/vim-gitgutter'
    -- #000000 - shows black
    use 'norcalli/nvim-colorizer.lua'
    -- LSP plugins
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp' -- not lsp but general cmp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    -- color theme
    use 'EdenEast/nightfox.nvim'
    use 'tamton-aquib/staline.nvim'
    -- dap
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    -- dap python
    use 'mfussenegger/nvim-dap-python'


end)

-- c-K - on definiton
-- c-O - go back
-- install :LspInstallInfo
--   i - install
--   X - remove
--   u - update
--:LspInfo - what LSP is running on this buffer
--in file with LSP
--gl - show the error
--
--
--plugins you need
--   neovim/nvim-lspconfig for basic LSP config
--   williamboman/nvim-lsp-installer for :LSPInstallInfo
--   hrsh7th/cmp-nvim-lsp for completions
--   maybe need hrsh7th/nvim-cmp for completions in general
