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
    "sakhnik/nvim-gdb",
  },
}
