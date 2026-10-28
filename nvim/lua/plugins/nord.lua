return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional configurations (uncomment to enable):
      -- vim.g.nord_contrast = true           -- Make sidebars and popup menus darker than current window
      -- vim.g.nord_borders = false            -- Enable/disable border decorations
      -- vim.g.nord_disable_background = false -- Disable background for transparent terminals
      -- vim.g.nord_italic = true              -- Enable italic comments/keywords
      -- vim.g.nord_bold = true                -- Enable bold keywords

      vim.cmd.colorscheme("nord")
    end,
  },
}
