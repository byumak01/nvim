local dap = require('dap')
local dapui = require('dapui')

dapui.setup()
require('nvim-dap-virtual-text').setup()

-- Open UI when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- C/C++ Debugging Configuration for LLDB (codelldb)
dap.adapters.lldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath('data') .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  }
}

dap.configurations.cpp = {
  {
    name = "Launch C++ (LLDB)",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {}, -- You can specify program arguments here
    runInTerminal = false,
  }
}
dap.configurations.c = dap.configurations.cpp -- Use same config for C

