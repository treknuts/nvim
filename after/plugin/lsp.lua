vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(args)
    require("tkvim.java").setup()
  end,
})
