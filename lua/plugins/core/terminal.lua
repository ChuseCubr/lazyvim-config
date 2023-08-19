return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    keys = {
      "<c-\\>",
      {
        "<leader>gg",
        "<cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true },
        desc = "Lazygit (cwd)",
      },
    },
    opts = {
      open_mapping = "<c-\\>",
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

      function _lazygit_toggle()
        lazygit:toggle()
      end
    end,
  },
}
