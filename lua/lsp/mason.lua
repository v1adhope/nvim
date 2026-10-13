local ok, mason = pcall(require, "mason")
if not ok then
	return
end

mason.setup({
	-- log_level = vim.log.levels.DEBUG,
	-- install_root_dir = path.concat { vim.fn.stdpath "config", "mason" },
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local ok, mason_lsp = pcall(require, "mason-lspconfig")
if not ok then
	return
end

-- Install and enable exactly the servers configured in lsp/servers.lua.
-- Sorted so the list Mason works through is stable between runs.
local names = vim.tbl_keys(require("lsp/servers"))
table.sort(names)

mason_lsp.setup({
	automatic_enable = names,
	ensure_installed = names,
})
