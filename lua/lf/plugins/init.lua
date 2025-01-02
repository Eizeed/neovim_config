return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  { 
    "rose-pine/neovim", 
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine-moon")
    end
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
         icons = false,
      }
    end
  },
}
