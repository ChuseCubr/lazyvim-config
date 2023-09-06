return {

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      {
        "tpope/vim-dadbod",
      },
      {
        "kristijanhusak/vim-dadbod-completion",
        config = function()
          local cmp = require("cmp")
          vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("dadbod_cmp", { clear = true }),
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
              cmp.setup.buffer({
                sources = {
                  { name = "vim-dadbod-completion" },
                  { name = "buffer" },
                  { name = "luasnip" },
                },
              })
            end,
          })
        end,
      },
    },
  },
}
