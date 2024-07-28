# Kontroll.nvim

Sync the LEDs on your ZSA keyboard to your mode in Neovim!

This plugin hooks into ZSA keyboards using Kontroll, a utility made by ZSA.

From [ZSA's announcement post](https://blog.zsa.io/introducing-kontroll/):

> Kontroll is an open-source command-line tool available for Windows, macOS and Linux. It plugs into Keymapp (version 1.3.0 and above) and allows you to control your keyboard using the command line or scripts.

## Requirements

- A ZSA [Moonlander](https://www.zsa.io/moonlander) or [Voyager](https://www.zsa.io/voyager) keyboard (tested on Voyager)
- An up-to-date version of [Keymapp](https://www.zsa.io/flash) that supports Kontroll
- [Kontroll](https://blog.zsa.io/introducing-kontroll/)
- Neovim 0.10+ (this plugin uses `vim.system` to call Kontroll asynchronously)

## Features

- Per-mode colors that are easily customizable
- Releases control of keyboard lighting when Neovim loses focus

## Installation

Kontroll.nvim supports any plugin manager.

### Lazy

```lua
{
    'lukewiebe/kontroll.nvim',
    opts = {},
}
```

### Packer

```lua
require('packer').startup(function()
    use 'lukewiebe/kontroll.nvim'
end)
```

### Paq

```
require("paq").setup({
    'lukewiebe/kontroll.nvim',
})
```

### vim-plug

```
Plug 'lukewiebe/kontroll.nvim'
```

## Setup

To initialize the plugin, put this in your `init.lua`.

```
require("kontroll").setup()
```

### Configuration

You can customize the colors of your keyboard by passing options to `setup`. Here are the defaults:

```
require("kontroll").setup({
	colors = {
		["Normal"] = "#FFFFFF",
		["Insert"] = "#780000",
		["Command"] = "#007200",
		["Visual"] = "#0D00A4",
	},
})
```
