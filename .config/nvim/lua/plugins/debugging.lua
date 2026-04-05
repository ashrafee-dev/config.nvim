return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "mxsdev/nvim-dap-vscode-js",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    require("dap-go").setup()
    require("dap-python").setup("python3")

    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = {
        "pwa-node",
        "pwa-chrome",
        "pwa-msedge",
        "node-terminal",
      },
    })

    for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch current file (Node)",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch Chrome against localhost",
          url = "http://localhost:5173",
          webRoot = "${workspaceFolder}",
        },
      }
    end

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "dap-repl", "dapui_console" },
      callback = function()
        vim.opt_local.winfixheight = true
      end,
    })

    vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step out" })

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP: Conditional breakpoint" })

    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run last" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP: Terminate" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })

    vim.keymap.set("n", "<leader>dw", function()
      require("dapui").elements.watches.add()
    end, { desc = "DAP: Add watch" })

    vim.keymap.set("n", "<leader>dW", function()
      require("dapui").elements.watches.remove()
    end, { desc = "DAP: Remove watch" })
  end,
}
