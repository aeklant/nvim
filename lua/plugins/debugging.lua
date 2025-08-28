return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

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

			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint"})
			vim.keymap.set("n", "<Leader>dl", dap.step_into, { desc = "Debugger step into"} )
			vim.keymap.set("n", "<Leader>dj", dap.step_over, { desc = "Debugger step over"} )
			vim.keymap.set("n", "<Leader>dh", dap.step_out, { desc = "Debugger step out"} )
			vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debugger continue"} )
		end,
	},
	{
    -- for display of variable values next to them in the code
    -- TODO: customize setup
		"theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
	},
}
