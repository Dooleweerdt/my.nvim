-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'barbar'
---@type LazySpec
return {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      print("--- Barbar.lua: Init Loaded! ---")
    end,

    config = function()
      require('barbar').setup({
        options = {
          exclude_ft = { 'terminal', 'toggleterm', 'qf' },
          print("--- Barbar.lua: Setup Loaded! ---")
        },
      })

    -- ── HIGHLIGHT LOADING ──────────────────────────────────────
    local function apply_barbar_highlights()
        -- Attempt to fetch the active palette colors
        local status_ok, cp = pcall(require, "catppuccin.palettes")
        if not status_ok then return end
        local palette = cp.get_palette("mocha")
        if not palette then return end

        local fg_active = palette.lavender  -- Color of the text for the active file
        local bg_active = palette.surface1  -- Slightly lighter dark background for active tab
        local bg_inactive = palette.mantle  -- Deep dark background for background tabs

        -- Apply the color overrides to Neovim
        local set_hl = vim.api.nvim_set_hl

        -- Active Tab Styling (Text, Modifiers, and Background)
        set_hl(0, 'BufferCurrent',      { fg = fg_active, bg = bg_active, bold = true })
        set_hl(0, 'BufferCurrentIndex', { fg = fg_active, bg = bg_active })
        set_hl(0, 'BufferCurrentMod',   { fg = palette.yellow, bg = bg_active, bold = true })
        set_hl(0, 'BufferCurrentSign',  { fg = fg_active, bg = bg_active })

        -- Inactive Tab Styling (Pushes unselected tabs into the background)
        set_hl(0, 'BufferInactive',     { fg = palette.overlay1, bg = bg_inactive })
        set_hl(0, 'BufferInactiveSign', { fg = bg_inactive, bg = bg_inactive })
        print("--- Barbar.lua: ColorScheme Loaded! ---")
    end

    if vim.g.colors_name and vim.g.colors_name:match("catppuccin") then
      apply_barbar_highlights()
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catpuccin*",
      callback = apply_barbar_highlights,
    })
    print("--- Barbar.lua: FINISHED LOADING ---")
    -- ────────────────────────────────────────────────────────────────
  end,
}}

