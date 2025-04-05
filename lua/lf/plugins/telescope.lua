return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "plenary"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "assets"
                }
            }
        })


        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Telescope lsp references' })
        vim.keymap.set('n', 'gy', builtin.lsp_type_definitions, { desc = 'Telescope lsp type definitions' })
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Telescope lsp implementations' })
    end
}
