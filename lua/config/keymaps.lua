-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.luaj
-- Add any additional keymaps here
-- Also for Ctrl+d and Ctrl+u (half-page scroll)                                 
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })  
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })    
-- vim.keymap.set("n", "n", "nzz", { desc = "Next search result and center" })
-- vim.keymap.set("n", "N", "Nzz", { desc = "Previous search result and center" })
-- Scroll offset - keep 10 lines above and below cursor
vim.opt.scrolloff = 8        -- Vertical scroll offset
vim.opt.sidescrolloff = 8     -- Horizontal scroll offset (optional)
