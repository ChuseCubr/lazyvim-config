-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- save last location (for cd on exit)
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = vim.api.nvim_create_augroup("LastLoc", { clear = true }),
  callback = function()
    local last_path = vim.fn.getcwd()
    local temp_path = vim.fn.stdpath("state") .. "/last_dir_path"
    vim.fn.writefile({ last_path }, temp_path)
  end,
})
