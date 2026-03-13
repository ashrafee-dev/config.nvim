return {
  {
    "github/copilot.vim",
    init = function()
      -- disable automatic code suggestions
      vim.g.copilot_enabled = false
      vim.g.copilot_no_tab_map = true
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      window = {
        layout = "vertical", -- floating window instead of big split
        width = 0.4, -- 40% of screen
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      -- shortcut: press ccc in normal mode
      vim.keymap.set("n", "ccc", function()
        require("CopilotChat").open()
      end, { desc = "Open Copilot Chat" })
    end,
  },
}
