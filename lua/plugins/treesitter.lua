return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "lua",
        "vim",
        "yaml",
        "json",
        "dockerfile",
        "c",
        "cpp",
      },

      highlight = {
        enable = true,
      },
    },
  },
}
