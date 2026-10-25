# Neovim Config

Personal Neovim setup — LSP (clangd, bashls, yamlls, dockerls) via Mason,
Telescope, Treesitter, gitsigns, blink.cmp, toggleterm, lualine.

## Requirements

- Neovim >= 0.11
- git
- A C compiler (`clang` or `gcc`) — required by Treesitter to build parsers
- A [Nerd Font](https://www.nerdfonts.com/) installed and set in your terminal
  (e.g. `JetBrainsMono Nerd Font`) — required for icons (lualine, devicons)
- `ripgrep` — required by Telescope's live grep
  ```bash
  brew install ripgrep
  ```

## Install

```bash
git clone https://github.com/med-am1n/nvim ~/.config/nvim
nvim
```

On first launch:
1. `lazy.nvim` bootstraps itself automatically (no manual step needed).
2. Plugins install automatically, pinned to the versions in `lazy-lock.json`.
3. Mason installs the configured LSP servers automatically.

Run `:Lazy sync` once everything settles, just to confirm all plugins
installed cleanly.

## Notes

- Colorscheme: `gruber-darker` — change in `lua/plugins/theme.lua` if desired.
- Leader key: `<\>` (backslash, Neovim default)
- See `lua/config/keymaps.lua` for all custom keybindings.
