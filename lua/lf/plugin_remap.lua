-- Telescope keymaps
require('telescope').setup({})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})


-- Harpoon keymaps
local harpoon = require('harpoon')

harpoon:setup({})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)


-- LSP keymap
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

vim.keymap.set('i', '<C-p>', cmp.mapping.select_prev_item(cmp_select), {})
vim.keymap.set('i', '<C-n>', cmp.mapping.select_next_item(cmp_select), {})
vim.keymap.set('i', '<C-y>', cmp.mapping.confirm({ select = true }), {})
vim.keymap.set('i', '<C-a>', cmp.mapping.confirm({ select = true }), {})
vim.keymap.set('i', '<C-Space>', cmp.mapping.complete(), {})

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Space>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float(nil, { focus = false })<CR>', { noremap = true, silent = true })
