require('vitek-nvim.sets')
require('vitek-nvim.plugins')
require('vitek-nvim.colorscheme')
require('vitek-nvim.keymap')
require('vitek-nvim.autocmd')
require('vitek-nvim.statline')
require('vitek-nvim.dap')

require('colorizer').setup()
require('staline').setup()
require('dap-python').setup('/usr/bin/python')
require('dapui').setup()

--lsp config
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = function()
        -- on attach actions
        -- buffer = 0 only in this buffer
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = 0 })
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { buffer = 0 })
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { buffer = 0 })
        vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })

    end,
}


-- C-o out           in files + between
-- C-t back (from gd) between files
-- C-I idk
-- C-q in <leader>dl - puts into ?quickfixlist?
-- note: code actions are not unified in all LSs
-- :wa - save all
vim.opt.completeopt={ "menu", "menuone", "noselect" }

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
