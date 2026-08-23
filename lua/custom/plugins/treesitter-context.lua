-- treesitter-context
-- https://github.com/nvim-treesitter/nvim-treesitter-context

vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-context' }
require('treesitter-context').setup {
  -- How many lines the window should span. Values <= 0 mean no limit.
  max_lines = 3,
  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  min_window_height = 20,
  -- Maximum number of lines to show for a single context
  multiline_threshold = 20,
  -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  trim_scope = 'outer',
  -- Line used to calculate context. Choices: 'cursor', 'topline'
  mode = 'cursor',
}
