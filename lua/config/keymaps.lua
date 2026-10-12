local keymap = vim.keymap.set

------------------------------------------------------------------------------
-- BASICS 
------------------------------------------------------------------------------
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

------------------------------------------------------------------------------
-- TERMINAL
------------------------------------------------------------------------------
-- Easier escape back to Normal mode from Terminal mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Reuse window-nav keys inside terminal buffers, same as normal splits
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

-- Quick built-in terminal splits (works even without toggleterm)
keymap("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })
keymap("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Open terminal (vertical split)" })

------------------------------------------------------------------------------
-- BUFFER NAVIGATION
------------------------------------------------------------------------------
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

------------------------------------------------------------------------------
-- LINE MOVEMENT (visual mode)
------------------------------------------------------------------------------
-- Move selected lines up/down, re-indenting and re-selecting automatically
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
keymap("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap("v", ">", ">gv", { desc = "Indent right and keep selection" })
--- Line navigation
keymap("n", "<leader>h", "^", { desc = "Start of line" })
keymap("n", "<leader>l", "$", { desc = "End of line" })

-- New lines
keymap("n", "<leader>o", "o<Esc>", { desc = "New line below" })
keymap("n", "<leader>O", "O<Esc>", { desc = "New line above" })-----------------------------------------------------------------------------
-- SCROLLING / SEARCH (keep cursor centered)
------------------------------------------------------------------------------
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, keep cursor centered" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, keep cursor centered" })
keymap("n", "n", "nzzzv", { desc = "Next search result, centered" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result, centered" })

------------------------------------------------------------------------------
-- CLIPBOARD / DELETE FIXES
------------------------------------------------------------------------------
-- Paste over a visual selection without losing what you just yanked
keymap("v", "p", '"_dP', { desc = "Paste without overwriting yank register" })

-- Delete (d/x) discards into the black hole register instead of the
-- unnamed register, so it stops overwriting your clipboard/yank
keymap({ "n", "v" }, "d", '"_d', { desc = "Delete without yanking" })
keymap({ "n", "v" }, "x", '"_x', { desc = "Delete char without yanking" })
keymap({ "n", "v" }, "s", '"_s', { desc = "Substitute without yanking" })
-- Explicit "cut" (old default d behavior: delete AND yank), for when
-- you actually want to delete here and paste it somewhere else
keymap({ "n", "v" }, "<leader>d", "d", { desc = "Cut (delete + yank)" })

------------------------------------------------------------------------------
-- MISC QUALITY OF LIFE
------------------------------------------------------------------------------
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

------------------------------------------------------------------------------
-- TELESCOPE
------------------------------------------------------------------------------
local ok_telescope, builtin = pcall(require, "telescope.builtin")
if ok_telescope then
  keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
  keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep in project" })
  keymap("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
  keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
  keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
end
keymap("n", "<F1>", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
keymap("n", "<leader>ft", "<cmd>Telescope colorscheme<CR>", { desc = "Choose colorscheme" })
------------------------------------------------------------------------------
-- GITSIGNS
------------------------------------------------------------------------------
local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if ok_gitsigns then
  keymap("n", "]c", gitsigns.next_hunk, { desc = "Next git hunk" })
  keymap("n", "[c", gitsigns.prev_hunk, { desc = "Previous git hunk" })
  keymap("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview git hunk" })
  keymap("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage git hunk" })
end
