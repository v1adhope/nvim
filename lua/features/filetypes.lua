-- Filetype overrides. Patterns are matched against the file name, unanchored
-- at the end, the same way Neovim matches its own.
vim.filetype.add({
	pattern = {
		-- Neovim calls these "env"; shell syntax and shfmt are wanted instead
		["^%.env%."] = "sh",
		["^Dockerfile%."] = "dockerfile",
	},
})
