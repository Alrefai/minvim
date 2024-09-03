-- NOTE: if 'timeoutlen' is low enough to cause occasional usage of |s| key
-- (that deletes character under cursor), disable it with the following call:
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')
