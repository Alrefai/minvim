-- virt-column
-- https://github.com/lukas-reineke/virt-column.nvim

vim.pack.add { 'https://github.com/lukas-reineke/virt-column.nvim' }
require('virt-column').setup {
  virtcolumn = '81',
  highlight = { 'Whitespace' },
}
