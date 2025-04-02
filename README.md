# code-runner.nvim

Async Code Runner for Neovim

![Image](https://github.com/user-attachments/assets/e8a3d6e8-59ee-41b1-bb19-be0a1d3d997f)

## Install

With nvim-plug:

```lua
require("plug").add({
	{
		"wsdjeg/code-runner.nvim",
		depends = {
			{ "wsdjeg/job.nvim" },
		},
	},
})
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
