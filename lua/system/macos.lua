-- macOS-specific settings, see lua/consts.lua for the system detection.

-- TODO: adjust when will be used

return {
	-- Vim options as { name = value }, applied in lua/settings.lua
	options = {},

	-- Keymaps as { mode, lhs, rhs }, applied in lua/keymaps.lua
	keymaps = {},

	-- Mappings owned by a plugin, read by its spec in lua/plugins
	plugins = {
		move = {
			left = "",
			right = "",
			down = "<C-o>",
			up = "<C-i>",

			line_left = "",
			line_right = "",
			line_down = "<C-o>",
			line_up = "<C-i>",
		},

		telescope = {
			delete_buffer = "<C-d>",
		},

		autopairs = {
			fast_wrap = false,
		},
	},
}
