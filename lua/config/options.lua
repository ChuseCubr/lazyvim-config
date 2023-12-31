-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.title = true
vim.opt.showbreak = "↪"
vim.opt.expandtab = false
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
vim.opt.guicursor = "n-v-c-i:block"

vim.g.autoformat = false

if vim.fn.has("win32") == 1 then
  local powershell_options = {
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    -- shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end
