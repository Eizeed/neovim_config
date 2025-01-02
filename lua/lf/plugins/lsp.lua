return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "gopls",
                "rust_analyzer"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = 'rounded',
                }),
                documentation = cmp.config.window.bordered({
                    border = 'rounded',
                })
            },
            performance = {
                max_view_entries = 15,
            },
            --            mapping = cmp.mapping.preset.insert({
            --                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            --                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            --                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            --                ["<C-Space>"] = cmp.mapping.complete(),
            --            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                })
        })


        --        vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
        --        vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float(nil, { focus = false })<CR>', { noremap = true, silent = true })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = true,
                refreshSupport = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
            local default_diagnostic_handler = vim.lsp.handlers[method]
            vim.lsp.handlers[method] = function(err, result, context, config)
                if err ~= nil and err.code == -32802 then
                    return
                end
                return default_diagnostic_handler(err, result, context, config)
            end
        end
    end
}