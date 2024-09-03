-- Make Neotree always visible
--
-- references:
-- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/679
--
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
  once = true,
  callback = function(_)
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree")
    end
  end,
})
