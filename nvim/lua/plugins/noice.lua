return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = {
        -- Override markdown rendering so that cmp / other plugins use Treesitter
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,        -- Use a floating search bar instead of bottom
        command_palette = true,       -- Position the cmdline and popupmenu together in the center
        long_message_to_split = true, -- Long messages will be sent to a split
        inc_rename = false,           -- Enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- Add a border to hover docs and signature help
      },
    },
  },
}
