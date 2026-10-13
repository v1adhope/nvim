-- Linux-specific settings, see lua/consts.lua for the system detection.

return {
	-- Vim options as { name = value }, applied in lua/settings.lua
	options = {},

	-- Keymaps as { mode, lhs, rhs }, applied in lua/keymaps.lua
	keymaps = {},

	-- Mappings owned by a plugin, read by its spec in lua/plugins
	plugins = {
		move = {
			left = "<M-h>",
			right = "<M-l>",
			down = "<M-j>",
			up = "<M-k>",

			line_left = "<M-h>",
			line_right = "<M-l>",
			line_down = "<M-j>",
			line_up = "<M-k>",
		},

		telescope = {
			delete_buffer = "<M-d>",
		},

		autopairs = {
			fast_wrap = "<M-e>",
		},
	},
}
