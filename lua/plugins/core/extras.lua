return {
  -- {
  --   "godlygeek/tabular",
  --   vscode = true,
  -- },

  {
    "echasnovski/mini.align",
    version = "*",
    config = true,
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
