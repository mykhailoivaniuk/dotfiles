-- This is automatic formatter that hooks into active lsp buffer and reformats it
-- Note that you need to have formatters specified in this config installed using Mason
return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.gofumpt,
				},
			})
			-- [L]sp [F]ormat
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
		end,
	},
}
