local config = function()
	local ok, telescope = pcall(require, "telescope")
	if not ok then
		return
	end

	local ok, actions = pcall(require, "telescope.actions")
	if not ok then
		return
	end

	telescope.setup({
		defaults = { file_ignore_patterns = { "vendor" } },
		pickers = {
			buffers = {
				mappings = {
					n = { [System.plugins.telescope.delete_buffer] = actions.delete_buffer },
				},
			},
		},
	})

	-- Native sorter, only active once the extension is loaded
	pcall(telescope.load_extension, "fzf")
end

return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = config,
	},
}
