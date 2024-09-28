return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"marksman", --markdown
				"ts_ls", --typescript-language-server
				"jsonls",
				"yamlls",
				"pyright", -- python
				"rust_analyzer",
				"gopls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf }

				-- [G]o to [D]efinition
				-- Jump to the definition of the word under your cursor.
				-- This is where a variable was first declared, or where a function is defined, etc.
				-- To jump back, press <C-t>.
				vim.keymap.set("n", "gd", function()
					require("telescope.builtin").lsp_definitions()
				end, opts)

				-- [G]o to [R]eferences
				-- Find references for the word under cursor
				vim.keymap.set("n", "gr", function()
					require("telescope.builtin").lsp_references()
				end, opts)

				-- [G]o to [I]mplementation
				-- Jump to the implementation of the word under your cursor.
				-- Useful when your language has ways of declaring types without an actual implementation.		       vim.keymap.set("n", "K", function()
				vim.keymap.set("n", "gi", function()
					require("telescope.builtin").lsp_implementations()
				end, opts)

				-- Type [D]efinition
				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				vim.keymap.set("n", "<leader>D", function()
					require("telescope.builtin").lsp_type_definitions()
				end, opts)

				-- [R]e[N]ame the variable under the cursor
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, opts)

				-- [C]ode [A]ction
				-- Cursor needs to be on top of error/suggestion to activate
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, opts)

				-- [D]ocument [S]ymbols
				-- Fuzzy find all the symbols in your current document.
				-- Symbols are things like variables, functions, types, etc.
				vim.keymap.set("n", "<leader>ds", function()
					require("telescope.builtin").lsp_document_symbols()
				end, opts)

				-- [V]orkspace [S]ymbols
				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over entire project.
				vim.keymap.set("n", "<leader>vs", function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end, opts)

                -- Open [D]iagnostic
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)

				-- [D]iagnosic Next
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)

				-- [D]iagnostic Prev
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				-- Signature [H]elp
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})
	end,
}
