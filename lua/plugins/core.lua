return {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "mason-org/mason.nvim",
  },

  {
    "mason-org/mason-lspconfig.nvim",
  },

  {
    "Saghen/blink.cmp",
    version = "*",
  },

  {
    "lewis6991/gitsigns.nvim",
  },

  {
    "numToStr/Comment.nvim",
  },

  {
    "X3eRo0/dired.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require("dired").setup({})
      vim.keymap.set("n", "<leader><leader>", "<cmd>Dired<CR>", { desc = "Open Dired" })
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      image = {
        enabled = true,
        doc = {
          -- render images inside mad files automatically
          enabled = true, 
        },
      },
    },
}

}
