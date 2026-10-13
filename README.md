# nvim

Personal Neovim config, plugin-managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

Used as a component of:

- [dotfiles-arch-linux](https://github.com/v1adhope/dotfiles-arch-linux)
- [dotfiles-macos](https://github.com/v1adhope/dotfiles-macos)

This config merges usage experience gathered from running it as a component
in both of the repos above into a single, OS-aware setup.

## System-specific config

Anything that differs between Linux and macOS (clipboard, options, keymaps)
lives in `lua/system/linux.lua` / `lua/system/macos.lua` and is exposed
through the global `System` table.
