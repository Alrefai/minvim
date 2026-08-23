-- Noice
-- https://github.com/folke/noice.nvim

vim.pack.add {
  'https://github.com/folke/noice.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  -- OPTIONAL:
  --   `nvim-notify` is only needed, if you want to use the notification view.
  --   If not available, we use `mini` as the fallback
  'https://github.com/rcarriga/nvim-notify',
}
require('noice').setup {
  lsp = {
    -- [[
    -- override markdown rendering so that **cmp** and other plugins use
    -- **Treesitter**
    -- ]]
    override = {
      -- override the default lsp markdown formatter with Noice
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      -- override the lsp markdown formatter with Noice
      ['vim.lsp.util.stylize_markdown'] = true,
      -- override cmp documentation with Noice (needs the other options to work)
      ['cmp.entry.get_documentation'] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    long_message_to_split = true, -- long messages will be sent to a split
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  popupmenu = {
    ---@type 'nui'|'cmp'
    backend = 'nui', -- backend to use to show regular cmdline completions
  },
  routes = {
    -- Show `@recording` messages
    {
      view = 'notify',
      filter = { event = 'msg_showmode' },
    },
    -- Hide `written` messages
    {
      filter = {
        event = 'msg_show',
        kind = '',
        find = 'written',
      },
      opts = { skip = true },
    },
    -- Hide `No inforamtion available` messages
    {
      filter = {
        event = 'notify',
        find = 'No information available',
      },
      opts = { skip = true },
    },
    --- Hide various unwanted messages
    {
      filter = {
        event = 'msg_show',
        any = {
          { find = '%d+L, %d+B' },
          { find = '; after #%d+' },
          { find = '; before #%d+' },
          { find = '%d fewer lines' },
          { find = '%d more lines' },
        },
      },
      opts = { skip = true },
    },
  },
}
