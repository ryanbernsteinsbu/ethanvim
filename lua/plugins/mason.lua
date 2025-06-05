return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					border = "none",
					icons = {
						package_installed = "",
						package_pending = "◍",
						package_uninstalled = "",
					},
				},
				log_level = vim.log.levels.INFO,
				max_concurrent_installers = 4,
			},
		},
		"neovim/nvim-lspconfig",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		local signs = {

			{ name = vim.diagnostic.severity.ERROR, text = "" },
			{ name = vim.diagnostic.severity.WARN, text = "" },
			{ name = vim.diagnostic.severity.HINT, text = "" },
			{ name = vim.diagnostic.severity.INFO, text = "" },
		}
		local text_arr = {}

		for _, sign in ipairs(signs) do
			--  		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			text_arr[sign.name] = sign.text
		end

		local config = {
			virtual_text = false, -- disable virtual text
			signs = {
				active = signs, -- show signs
			},
			--text = { [vim.diagnostic.severity.ERROR] = 'P'}
			signs = { text = text_arr },
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}
		vim.diagnostic.config(config)

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		local function lsp_bufmaps()
			local opts = { noremap = true, silent = true }
			local function keymap(bufnr, mode, htk, cmd, opts)
                vim.keymap.set(mode, htk, cmd, {buffer = true})
            end
			keymap(bufnr, "n", "GD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			keymap(bufnr, "n", "Gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			keymap(bufnr, "n", "GI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			keymap(bufnr, "n", "Gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
			keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
			keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
			keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
			keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
			keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
			keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
		end

        local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})
        vim.api.nvim_create_autocmd('LspAttach', {
            group = lsp_cmds,
            desc = 'LSP actions',
            callback = function()
                lsp_bufmaps()
            end
        })
		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright",
				"lua_ls",
				"clangd",
				"jsonls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim", "love" },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME,
									},
								},
							},
						},
					})
				end,
			},
		})
	end,
}
