vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

vim.keymap.set("i", "jj", "<ESC>", { silent = true })


-- Center cursor on moving with ctrl + d/u
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>ee', 'iif err != nil {<ESC>oreturn<ESC>o}<ESC>vkk==jjA')
vim.keymap.set('i', '{<ENTER>', '{<ENTER>}<ESC>O')
vim.keymap.set('i', '(<ENTER>', '(<ENTER>)<ESC>O')
vim.keymap.set('i', '[<ENTER>', '[<ENTER>]<ESC>O')

-- Move lines
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>r', vim.lsp.buf.format)

-- Turn off arrow keys in NORMAL, INSERT and VISUAL modes
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('i', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('i', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('v', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('v', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('v', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('v', '<down>', '<cmd>echo "Use j to move!!"<CR>')

