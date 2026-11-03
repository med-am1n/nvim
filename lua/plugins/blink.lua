return {
  {
    "Saghen/blink.cmp",
    version = "*",

    opts = {
      keymap = {
        ["<Tab>"] = { "accept", "fallback" },
      },

      completion = {
        menu = {
          auto_show = false,
        },
      },
    },

    config = function(_, opts)
      require("blink.cmp").setup(opts)

      vim.keymap.set("i", "<C-e>", function()
        local cmp = require("blink.cmp")

        if cmp.is_visible() then
          cmp.hide()
        else
          cmp.show()
        end
      end, {
        desc = "Toggle completion suggestions",
      })
    end,
  },
}

