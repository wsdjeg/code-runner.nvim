# code-runner.nvim

Async Code Runner for Neovim

## Install

With nvim-plug:

```lua
require('plug').add({
  {
    'wsdjeg/code-runner.nvim',
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
