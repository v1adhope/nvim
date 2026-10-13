local ok, _ = pcall(require, "lsp/mason")
if not ok then
	return
end

local ok, handlers = pcall(require, "lsp/handlers")
if not ok then
	return
end

local ok, _ = pcall(require, "lsp/nvim_cmp")
if not ok then
	return
end

local ok, servers = pcall(require, "lsp/servers")
if not ok then
	return
end

-- Shared by every server; an entry in lsp/servers.lua overrides these.
local defaults = {
	on_attach = handlers.custom_lsp_attach,
	capabilities = handlers.capabilities,
}

for name, config in pairs(servers) do
	vim.lsp.config[name] = vim.tbl_deep_extend("force", defaults, config)
end
