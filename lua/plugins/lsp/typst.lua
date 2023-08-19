return {
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
    config = function()
      require("lspconfig").typst_lsp.setup({
        settings = {
          exportPdf = "onSave",
        },
      })
    end,
  },
}
