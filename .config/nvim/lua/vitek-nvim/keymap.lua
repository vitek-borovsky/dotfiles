vim.g.mapleader = ' '
-- vim.keymap.set(
--  mode or {} list of modes
--  lfs
--  rhs can be lua function
vim.keymap.set('n', '<Leader>ff', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<Leader>ps', function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep for > ')}) end)

