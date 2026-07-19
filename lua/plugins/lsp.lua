return {

  {
    "mason-org/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "bashls",
          "yamlls",
          "dockerls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.clangd.setup({})
      lspconfig.bashls.setup({})
      lspconfig.yamlls.setup({})
      lspconfig.dockerls.setup({})

      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)

      vim.keymap.set(
        "n",
        "<leader>f",
        vim.lsp.buf.format
      )
    end,
  },
}
