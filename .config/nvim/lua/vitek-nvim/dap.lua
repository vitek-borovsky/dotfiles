vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F1>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition > ')<CR>")

-- python

vim.keymap.set("n", "<leader>gn", ":lua require'dap-python'.debug_method()<CR>")
vim.keymap.set("n", "<leader>gc", ":lua require'dap-python'.debug_class()<CR>")
vim.keymap.set("v", "<leader>gs", ":lua require'dap-python'.debug_selection()<CR>")
