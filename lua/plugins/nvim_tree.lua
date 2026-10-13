local config = function()
	local ok, tree = pcall(require, "nvim-tree")
	if not ok then
		return
	end

	local ok, tree_api = pcall(require, "nvim-tree.api")
	if not ok then
		return
	end

	local ok, _ = pcall(require, "features/create_keymap")
	if not ok then
		return
	end

	local on_attach = function(bufnr)
		-- Default mapping
		tree_api.config.mappings.default_on_attach(bufnr)

		local opts = function(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, nowait = true }
		end

		-- Telescope, defined once in lua/keymaps.lua
		local ok, keymaps = pcall(require, "keymaps")
		if not ok or type(keymaps) ~= "table" then
			return
		end

		for _, keymap in ipairs(keymaps.telescope) do
			Map("n", keymap[1], keymap[2], opts(keymap[3]))
		end
	end

	-- Disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	tree.setup({
		on_attach = on_attach,
		disable_netrw = true,
		diagnostics = {
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		git = { ignore = false },
		renderer = {
			indent_markers = { enable = true },
			icons = { git_placement = "after" },
		},
		-- view = { number = true }
	})

	-- open_on_setup migration
	local function open_nvim_tree(data)
		-- Buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		-- Buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		if not no_name and not directory then
			return
		end

		-- Change to the directory
		if directory then
			vim.cmd.cd(data.file)
		end

		-- Open the tree
		tree_api.tree.open()
	end

	vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	tag = "v1",
	config = config,
}
