-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- navigate through buffers
vim.keymap.set("n", "<Tab>", ":bn<CR>")
vim.keymap.set("n", "<S-Tab>", ":bp<CR>")

-- To close current buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
