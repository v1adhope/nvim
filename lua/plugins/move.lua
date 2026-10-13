local config = function()
	local ok, move = pcall(require, "mini.move")
	if not ok then
		return
	end

	move.setup({ mappings = System.plugins.move })
end

return {
	"nvim-mini/mini.move",
	version = "*",
	config = config,
}
