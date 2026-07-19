return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      vim.treesitter.language.register("c", "c")
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "markdown" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
