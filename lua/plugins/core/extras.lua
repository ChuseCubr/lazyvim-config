return {
  -- {
  --   "godlygeek/tabular",
  --   vscode = true,
  -- },

  {
    "christoomey/vim-tmux-navigator",
    config = function()
      if vim.fn.has("unix") == 1 then
        vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
        vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
        vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
        vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
      end
    end,
  },

  {
    "echasnovski/mini.align",
    version = "*",
    config = true,
  },

  {
    "tpope/vim-abolish",
  },

  {
    "NvChad/nvim-colorizer.lua",
    vscode = true,
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = false,
        names = false,
        RRGGBBAA = true,
      },
    },
  },
}
