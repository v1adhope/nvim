-- Dispatch table: server name -> `vim.lsp.config` overrides.
--
-- Shared defaults (on_attach, capabilities) are merged in by
-- lsp/init.lua, so an entry only carries what is distinctive to that
-- server; an empty table means "defaults are fine".
--
-- This table is also the installation list: lsp/mason.lua installs and enables
-- exactly these servers.
--
-- Upstream settings docs:
--   Lua - https://github.com/sumneko/lua-language-server/blob/master/locale/en-us/setting.lua
--   Go  - https://github.com/golang/tools/blob/master/gopls/doc/settings.md

return {
	lua_ls = {
		filetypes = { "lua" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					disable = {
						"redefined-local",
					},
					globals = {
						"vim",
						-- Defined by this config, see lua/consts.lua
						-- and lua/features/create_keymap.lua
						"Theme",
						"Os",
						"System",
						"Map",
						"nnoremap",
						"vnoremap",
						"inoremap",
						"tnoremap",
						"use",
						"case_sensitive",
					},
				},
				workspace = {
					-- Every runtimepath directory: the Neovim core runtime,
					-- this config and the installed plugins. Evaluated when
					-- this module is first required, so anything lazy.nvim has
					-- not loaded by then is not included.
					library = vim.api.nvim_get_runtime_file("", true),
					-- Don't offer to set the workspace up as a known framework
					-- (love2d and friends); accepting that writes a .luarc.json
					-- into the project, which then overrides these settings.
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	gopls = {
		filetypes = { "go" },
		settings = {
			gopls = {
				analyses = {
					composites = false,
				},
				gofumpt = true,
			},
		},
	},
	rust_analyzer = { filetypes = { "rust" } },
	-- nil_ls = { filetypes = { "nix" } },
	jsonls = { filetypes = { "json", "jsonc" } },
	yamlls = { filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" } },
	marksman = { filetypes = { "markdown", "markdown.mdx" } },
	docker_language_server = { filetypes = { "dockerfile" } },
	taplo = { filetypes = { "toml" } },
	regols = { filetypes = { "rego" } },
	bashls = {},
	pyright = {},
}
