-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.showbreak = "↪"
vim.opt.list = true
vim.opt.listchars:append({
  -- New line
  eol = "↲",

  -- Spaces
  trail = "⋅",
  tab = "→ ",
  nbsp = "␣",

  -- Others
  extends = "»",
  precedes = "«",
})

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
