return {
  "yetone/avante.nvim",

  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",

  event = "VeryLazy",
  version = false,

  opts = {
    instructions_file = "avante.md",

    provider = "deepseek",

    providers = {
      deepseek = {
        __inherited_from = "openai",

        endpoint = "https://api.deepseek.com/v1",
        api_key_name = "DEEPSEEK_API_KEY",

        model = "deepseek-v4-flash",
        -- model = "deepseek-v4-flash",

        timeout = 30000,

        extra_request_body = {
          temperature = 0.75,
          max_tokens = 8192,
          thinking = {
            type = "disabled",
          },
        },
      },

      moonshot = {
        __inherited_from = "openai",

        endpoint = "https://api.moonshot.ai/v1",
        api_key_name = "MOONSHOT_API_KEY",

        model = "kimi-k2-0711-preview",

        timeout = 30000,

        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- Optional
    "nvim-mini/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",

    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },

    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "Avante" },
      opts = {
        file_types = { "markdown", "Avante" },
      },
    },
  },
}
