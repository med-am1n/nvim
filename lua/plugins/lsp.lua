return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "bashls",
          "yamlls",
          "dockerls",
        },
      })

      -- New Neovim 0.11+ API: configure servers with vim.lsp.config,
      -- then turn them on with vim.lsp.enable.
      -- nvim-lspconfig still ships the default per-server settings,
      -- so passing {} is enough to use its defaults.
      vim.lsp.config("clangd", {})
      vim.lsp.config("bashls", {})
      vim.lsp.config("yamlls", {})
      vim.lsp.config("dockerls", {})

      vim.lsp.enable({ "clangd", "bashls", "yamlls", "dockerls" })

      -- Keymaps only apply once an LSP client actually attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
        end,
      })
    end,
  },
}
