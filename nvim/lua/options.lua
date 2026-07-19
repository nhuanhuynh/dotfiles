-- ~/.config/nvim/lua/options.lua
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation (C/C++ style)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Split
opt.splitbelow = true
opt.splitright = true

-- Misc
opt.updatetime = 250
opt.clipboard = "unnamedplus"

opt.list = true
opt.listchars = {
  space = "·",
  tab = "→ ",
  trail = "·",
}
