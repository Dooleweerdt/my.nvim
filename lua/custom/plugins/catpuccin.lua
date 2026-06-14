-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'catpuccin'
---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure to load this first before all other start plugins
    lazy = false,
    config = function()
      require("catppuccin").setup({
        -- Optional: Configure Catppuccin options here
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        print("--- catpuccin.lua: Setup Loaded! ---")
      })

      -- Set the colorscheme inside the config function
      vim.cmd.colorscheme "catppuccin"
      print "Catpuccin.lua - Colorscheme set"
    end,
  },
}
