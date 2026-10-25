return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 15,
    open_mapping = [[<c-\>]], -- Ctrl+\ to toggle
    direction = "horizontal",      -- "float" | "horizontal" | "vertical" | "tab"
    float_opts = {
      border = "curved",
    },
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    close_on_exit = true,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Easier escape from terminal mode back to Normal mode
    vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
  end,
}
