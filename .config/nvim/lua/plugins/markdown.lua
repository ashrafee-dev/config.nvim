return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      render_modes = { "n" },
      anti_conceal = { enabled = true },
    },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          require("render-markdown").enable()

          local opts = { buffer = true, desc = "Toggle markdown render" }

          vim.keymap.set("n", "<C-e>", function()
            require("render-markdown").toggle()
          end, opts)

          vim.keymap.set("i", "<C-e>", function()
            vim.cmd("stopinsert")
            require("render-markdown").toggle()
          end, opts)
        end,
      })
    end,
  },
}
