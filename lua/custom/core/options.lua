-- Disable line wrap for all file types except Markdown
vim.cmd [[
  augroup DisableLineWrap
    autocmd!
    autocmd FileType * setlocal nowrap
    autocmd FileType markdown setlocal wrap
  augroup END
]]

-- Show Telescope File Browser on neovim startup without arguments.
--
-- ---
--
-- references:
-- - https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/679
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('TelescopeFileBrowserOnOpen', { clear = true }),
  once = true,
  callback = function(_)
    if vim.fn.argc() == 0 then vim.cmd 'Telescope file_browser' end
  end,
})

vim.o.winborder = 'rounded'

-- To appropriately highlight codefences returned from denols,
-- you will need to augment `vim.g.markdown_fenced` languages.
--
-- ---
--
-- references:
-- - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols
vim.g.markdown_fenced_languages = {
  'ts=typescript',
  'tsx=typescriptreact',
  'js=javascript',
  'jsx=javascriptreact',
}
