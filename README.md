# code-runner.nvim

Async Code Runner for Neovim

[![GitHub License](https://img.shields.io/github/license/wsdjeg/code-runner.nvim)](LICENSE)
[![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/wsdjeg/code-runner.nvim)](https://github.com/wsdjeg/code-runner.nvim/issues)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/wsdjeg/code-runner.nvim)](https://github.com/wsdjeg/code-runner.nvim/commits/master/)
[![GitHub Release](https://img.shields.io/github/v/release/wsdjeg/code-runner.nvim)](https://github.com/wsdjeg/code-runner.nvim/releases)
[![luarocks](https://img.shields.io/luarocks/v/wsdjeg/code-runner.nvim)](https://luarocks.org/modules/wsdjeg/code-runner.nvim)

![Image](https://github.com/user-attachments/assets/e8a3d6e8-59ee-41b1-bb19-be0a1d3d997f)

<!-- vim-markdown-toc GFM -->

- [Installation](#installation)
- [Setup](#setup)
- [Usage](#usage)
- [APIs](#apis)

<!-- vim-markdown-toc -->

## Installation

Using [nvim-plug](https://github.com/wsdjeg/nvim-plug)

```lua
require("plug").add({
	{
		"wsdjeg/code-runner.nvim",
		depends = {
			{ "wsdjeg/job.nvim" },
			{ "wsdjeg/notify.nvim" },
		},
	},
})
```

Using [luarocks](https://luarocks.org/)

```
luarocks install code-runner.nvim
```

## Setup

```lua
require("code-runner").setup({
	runners = {
		lua = { exe = "lua", opt = { "-" }, usestdin = true },
	},
	enter_win = false,
})
```

## Usage

1. start default runner for current filetype:

```
lua require('code-runner').open()
```

2. run specific command with code-runner:

```
lua require('code-runner').open('make test')
```

## APIs

- `close()`: close code runner window
- `get(ft)`: get default runner for specific filetype
