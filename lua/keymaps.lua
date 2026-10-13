-- Keymaps shared by every system. Keys that have to differ are defined in
-- lua/system and applied at the bottom of this file.
local ok, _ = pcall(require, "features/create_keymap")
if not ok then
	return
end

-- No highlighting
Map("n", "gnh", ":noh<CR>")

-- Buffer navigation
Map("n", "<Space><Space>", ":b#<CR>")

-- Split navigation
Map("n", "<C-h>", ":wincmd h<CR>")
Map("n", "<C-j>", ":wincmd j<CR>")
Map("n", "<C-k>", ":wincmd k<CR>")
Map("n", "<C-l>", ":wincmd l<CR>")

-- File explorer
Map("n", "fe", ":NvimTreeToggle<CR>")

-- Copy relative path to system clipboard
Map("n", "cp", ":let @+ = expand('%')<CR>")

-- Gitsigns
Map("n", "gbl", ":Gitsigns blame_line<CR>")
Map("n", "gph", ":Gitsigns preview_hunk<CR>")

-- Telescope. Exported because lua/plugins/nvim_tree.lua has to map them again
-- buffer-local, where nvim-tree's own `f` live filter would swallow them.
local telescope = {
	{ "ff", ":Telescope find_files<CR>", "Telescope find_files" },
	{ "fg", ":Telescope live_grep<CR>", "Telescope live_grep" },
	{ "fb", ":Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>", "Telescope buffers" },
	{ "fh", ":Telescope help_tags<CR>", "Telescope help_tags" },
	{ "fc", ":Telescope git_commits initial_mode=normal<CR>", "Telescope git_commits" },
	{ "fd", ":Telescope diagnostics initial_mode=normal<CR>", "Telescope diagnostics" },
}

for _, keymap in ipairs(telescope) do
	Map("n", keymap[1], keymap[2], { desc = keymap[3] })
end

-- Crates
Map("n", "<leader>cv", ":Crates show_versions_popup<CR>")
Map("n", "<leader>cf", ":Crates show_features_popup<CR>")
Map("n", "<leader>cR", ":Crates open_repository<CR>")

-- Lsp diagnostics, these work without an attached server.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
Map("n", "<space>e", vim.diagnostic.open_float)
Map("n", "<space>q", vim.diagnostic.setloclist)
Map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
Map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)

-- Lsp buffer-local keys. Exported because lua/lsp/handlers.lua has to map them
-- again for each buffer a language server attaches to.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local lsp_attach = function(bufopts)
	Map("n", "gD", vim.lsp.buf.declaration, bufopts)
	Map("n", "gd", vim.lsp.buf.definition, bufopts)
	Map("n", "gt", vim.lsp.buf.type_definition, bufopts)
	Map("n", "K", vim.lsp.buf.hover, bufopts)
	Map("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- Map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	Map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	Map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	Map("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	Map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	Map("n", "cd", vim.lsp.buf.rename, bufopts)
	Map("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	Map("n", "gr", vim.lsp.buf.references, bufopts)
	Map("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- This system only, see lua/system
for _, keymap in ipairs(System.keymaps) do
	Map(keymap[1], keymap[2], keymap[3])
end

return { telescope = telescope, lsp_attach = lsp_attach }
