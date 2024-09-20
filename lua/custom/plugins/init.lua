-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'alexghergh/nvim-tmux-navigation',
    event = 'VeryLazy',
    opts = {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = '<C-h>',
        down = '<C-j>',
        up = '<C-k>',
        right = '<C-l>',
        last_active = '<C-\\>',
        next = '<C-Space>',
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'zapling/mason-lock.nvim',
    cmd = { 'MasonLock', 'MasonLockRestore' },
    opts = {},
  },
  {
    'folke/noice.nvim',
    version = '*',
    event = 'VeryLazy',
    --- Configuration Recipes
    ---
    --- ---
    ---
    --- references:
    --- - https://github.com/folke/noice.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    --- - https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
    --- - https://github.com/omerxx/dotfiles/blob/2f715c6ed2149e67330155f15a001a624accdd28/nvim/lua/plugins/lazy.lua#L152C11-L165C11
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
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
        backend = 'cmp', -- backend to use to show regular cmdline completions
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
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'folke/trouble.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/todo-comments.nvim',
    },
    opts = { focus = true },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    config = function()
      require('zen-mode').setup {
        window = { backdrop = 1, width = 90 },
        plugins = {
          tmux = { enabled = true }, -- disables the tmux statusline
        },
      }

      -- Close zen-mode when leaving nvim.
      -- Fixes issue where tmux statusline is not restored when quitting nvim
      -- while in zen-mode.
      --
      -- ---
      --
      -- references:
      -- - https://github.com/folke/zen-mode.nvim/issues/111#issuecomment-2181237746
      vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
        callback = function()
          require('zen-mode').close()
        end,
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      options = {
        mode = 'tabs',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    version = '*',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ft = { 'markdown' },
    opts = {},
  },
  {
    -- TypeScript Language Server
    --
    -- ---
    --
    -- references:
    -- - https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
    'pmizio/typescript-tools.nvim',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      root_dir = require('lspconfig').util.root_pattern 'package.json',
      single_file_support = false,
    },
  },
  {
    'lukas-reineke/virt-column.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      virtcolumn = '81',
      highlight = { 'Whitespace' },
    },
  },
}
