vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd("silent! write")
  end,
})
