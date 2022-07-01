local augroup = vim.api.nvim_create_augroup
vitekGroup = augroup('vitek', {})

local autocmd = vim.api.nvim_create_autocmd

-- trim white space
 autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- highlight yank
autocmd('TextYankPost', {
    group = augroup('HighllightYank', {}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

--  lsp config

--source 'lspconfig'.pyright.setup{}

