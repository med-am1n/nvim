return {
  {
    "X3eRo0/dired.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("dired").setup({})
      -- Open Dired / Go to parent directory
      vim.keymap.set("n", "<BS>", function()
        if vim.bo.filetype == "dired" then
          vim.cmd("DiredGoUp")
        else
          vim.cmd("Dired")
        end
      end, {
        noremap = true,
        silent = true,
        desc = "Dired: Open / Go up",
      })
    end,
  },
}
