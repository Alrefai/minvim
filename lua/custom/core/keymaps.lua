-- NOTE: if 'timeoutlen' is low enough to cause occasional usage of |s| key
-- (that deletes character under cursor), disable it with the following call:
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

-- Misc
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- WINDOW MANAGEMENT
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split [W]indow [V]ertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split [W]indow [H]orizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make Splits [W]indow [E]qual Size" })
vim.keymap.set("n", "<leader>x", "<cmd>close<CR>", { desc = "[X] Close Current Split [W]indow" })
