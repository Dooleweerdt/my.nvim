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
  
    config = function()
      require('barbar').setup({
        options = {
          exclude_ft = { 'terminal', 'toggleterm', 'qf' },
        },
      })

    -- ── SAFE HIGHLIGHT LOADING ──────────────────────────────────────
    -- We wrap the overrides in a trigger that waits for Catppuccin safely
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin*",
      callback = function()    local cp = require("catppuccin.palettes").get_palette("mocha")

        local fg_active = cp.lavender  -- Color of the text for the active file
        local bg_active = cp.surface1  -- Slightly lighter dark background for active tab
        local bg_inactive = cp.mantle  -- Deep dark background for background tabs

        -- Apply the color overrides to Neovim
        local set_hl = vim.api.nvim_set_hl

        -- Active Tab Styling (Text, Modifiers, and Background)
        set_hl(0, 'BufferCurrent',      { fg = fg_active, bg = bg_active, bold = true })
        set_hl(0, 'BufferCurrentIndex', { fg = fg_active, bg = bg_active })
        set_hl(0, 'BufferCurrentMod',   { fg = cp.yellow, bg = bg_active, bold = true })
        set_hl(0, 'BufferCurrentSign',  { fg = fg_active, bg = bg_active })

        -- Inactive Tab Styling (Pushes unselected tabs into the background)
        set_hl(0, 'BufferInactive',     { fg = cp.overlay1, bg = bg_inactive })
        set_hl(0, 'BufferInactiveSign', { fg = bg_inactive, bg = bg_inactive })
    end,
    })
    -- ────────────────────────────────────────────────────────────────
  end,
}}

