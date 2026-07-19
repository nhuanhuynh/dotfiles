return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
        shade_terminals = true,
      })

      -- Set up a custom floating terminal to run the Antigravity CLI (agy)
      local Terminal = require("toggleterm.terminal").Terminal
      local agy = Terminal:new({
        cmd = "agy",
        direction = "float",
        hidden = true,
        float_opts = {
          border = "double",
          width = function()
            return math.floor(vim.o.columns * 0.85)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.85)
          end,
        },
        -- Close terminal buffer on exit
        on_close = function(term)
          vim.cmd("startinsert")
        end,
      })

      local function agy_toggle()
        agy:toggle()
      end

      -- Keybinding: <leader>a to toggle the Antigravity CLI terminal in Normal mode
      vim.keymap.set("n", "<leader>a", agy_toggle, { desc = "Toggle Antigravity CLI", silent = true })

      -- Keybinding: <C-a> (Ctrl+a) in Terminal mode to quickly toggle/hide the window
      vim.keymap.set("t", "<C-a>", agy_toggle, { desc = "Toggle Antigravity CLI", silent = true })
    end,
  },
}
