-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
local opts = { noremap = true, silent = true }
return {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    lazy = false,
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      noremap = true,
      silent = true,
    },
    -- Define your keymaps here using lazy.nvim syntax
    keys = {
      -- Move to previous/next buffer
      { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = 'Buffer: Go to previous', opts },
      { '<A-.>', '<Cmd>BufferNext<CR>',     desc = 'Buffer: Go to next', opts},

      -- Re-order to previous/next
      { '<A-<>', '<Cmd>BufferMovePrevious<CR>', desc = 'Buffer: Move left', opts },
      { '<A->>', '<Cmd>BufferMoveNext<CR>',     desc = 'Buffer: Move right', opts },

      -- Goto buffer in position
      { '<A-1>', '<Cmd>BufferGoto 1<CR>', desc = 'Buffer: Go to 1', opts },
      { '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = 'Buffer: Go to 2', opts },
      { '<A-3>', '<Cmd>BufferGoto 3<CR>', desc = 'Buffer: Go to 3', opts },

      -- Pin/unpin buffer
      { '<A-p>', '<Cmd>BufferPin<CR>',   desc = 'Buffer: Pin/Unpin', opts },

      -- Close buffer
      { '<A-c>', '<Cmd>BufferClose<CR>', desc = 'Buffer: Close', opts },

      -- Magic jump-to-buffer mode
      { '<A-j>', '<Cmd>BufferPick<CR>',  desc = 'Buffer: Pick jump', opts },
    },
  },
}

