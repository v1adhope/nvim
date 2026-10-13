local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local custom_lsp_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_set_option_value(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Defined once in lua/keymaps.lua
	local ok, keymaps = pcall(require, "keymaps")
	if not ok or type(keymaps) ~= "table" then
		return
	end

	keymaps.lsp_attach({ buffer = bufnr })
end

return {
	capabilities = capabilities,
	custom_lsp_attach = custom_lsp_attach,
}
