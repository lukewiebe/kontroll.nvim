# CLAUDE.md

## Project Overview

kontroll.nvim is a Neovim plugin that syncs LED lighting on ZSA keyboards (Moonlander/Voyager) with the current Neovim editing mode. It uses ZSA's Kontroll CLI to control keyboard RGB LEDs asynchronously.

## Project Structure

```
lua/kontroll.lua   — Single-file plugin, all logic lives here
README.md          — User-facing documentation
```

## Language & Conventions

- **Lua** — All plugin code is Lua targeting the Neovim API
- Module pattern: `local M = {}` / `return M` with a single `M.setup()` entry point
- Config merging via `vim.tbl_deep_extend("force", defaults, user_config)`
- Async system calls via `vim.system()`
- Requires **Neovim 0.10+**

## Formatting

- Uses [StyLua](https://github.com/JohnnyMorganz/StyLua) for Lua formatting
- Tabs for indentation

## Testing

No test framework is configured. Testing is manual via Neovim with a connected ZSA keyboard.

## External Dependencies

- **Kontroll CLI** — ZSA's command-line utility (called via `vim.system`)
- **Keymapp 1.3.0+** — ZSA's keyboard mapping software
- No Lua package dependencies
