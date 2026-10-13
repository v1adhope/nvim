Theme = "tokyonight"

-- Everything that has to differ between systems lives in lua/system
Os = vim.uv.os_uname().sysname

local systems = {
	Darwin = "system/macos",
	Linux = "system/linux",
}

local system = systems[Os]
if not system then
	io.stderr:write(string.format("nvim: %s is not implemented, add lua/system for it\n", Os))
	os.exit(1)
end

System = require(system)
