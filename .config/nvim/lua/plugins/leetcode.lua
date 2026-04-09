return {
  {
    "kawre/leetcode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lang = "python3",
      plugins = {
        non_standalone = true,
      },
    },
    cmd = { "Leet" },
    keys = {
      { "<leader>lc", "<cmd>Leet<cr>", desc = "Open LeetCode" },
    },
  },
}
-- make sure to run :TSInstall html
