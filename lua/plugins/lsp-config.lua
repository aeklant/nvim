return {
	{
		'mason-org/mason.nvim',
		opts = {},
		config = function()
			require('mason').setup()
		end,
	},
	{
		'mason-org/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'rust_analyzer', },
			})
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			--local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('rust_analyzer', {
        -- Server-specific settings. See `:help lsp-quickstart`
        settings = {
          ['rust-analyzer'] = {},
        },
      })

			vim.lsp.enable('lua_ls')
      vim.lsp.enable('rust_analyzer')

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
		end,
	},
}
