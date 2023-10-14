return {
  -- {
  --   "godlygeek/tabular",
  --   vscode = true,
  -- },

  {
    "imsnif/kdl.vim",
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
