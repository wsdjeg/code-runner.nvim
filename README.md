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
- [Runner Options](#runner-options)
    - [exe](#exe)
    - [opt](#opt)
    - [usestdin](#usestdin)
    - [range](#range)
    - [transform](#transform)
- [APIs](#apis)
- [Self-Promotion](#self-promotion)
- [License](#license)

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

## Runner Options

### exe

The `exe` option accepts a string, table, or function.
When it is a `string` or `table`, it is passed directly to `job.start` as the job command.
When it is a function, the function is executed first,
and its return value is then used as the command to start the job.

example:

```lua
require('code-runner').setup({
    runners = {
        lua = {
            exe = function()
                if vim.fn.executable('luajit') == 1 then
                    return 'luajit'
                elseif vim.fn.executable('lua') == 1 then
                    return 'lua'
                else
                    return { 'nvim', '-l' }
                end
            end,
            opt = { '-' },
            usestdin = true,
        },
    },
})
```

### opt

job command arguments which will be appended to job commands.

### usestdin

if usestdin is true, then runner use context in current buffer as stdin instead of using file name.

### range

if usestdin is true, then code-runner.nvim use `vim.fn.getline(runner.range[1], runner.range[2])` as default stdin, the default range is `{1, '$'})`.
This option is useful when run code block in markdown.

`ftplugin/markdown.lua`

```lua
vim.keymap.set('n', '<leader>lr', function()
    -- require https://github.com/Shougo/context_filetype.vim
    local cf = vim.fn['context_filetype#get']()

    if cf.filetype ~= 'markdown' then
        local runner = require('code-runner').get(cf.filetype)
        runner['usestdin'] = true
        runner['range'] = { cf['range'][1][1], cf['range'][2][1] }
        require('code-runner').open(runner)
    end
end, { silent = true, buffer = true })
```

### transform

To replace text in output, use transform option, this should be a function which accept one string argument and return a string.

for example:

```lua
require('code-runner').setup({
    runners = {
        lua = {
            exe = 'lua',
            opt = { '-' },
            usestdin = true,
            transform = function(line)
                return '[Lua output]' .. line
            end,
        },
    },
})
```

## APIs

- `close()`: close code runner window
- `get(ft)`: get default runner for specific filetype
- `get(ft)`: get default runner for specific filetype

## Self-Promotion

Like this plugin? Star the repository on
GitHub.

Love this plugin? Follow [me](https://wsdjeg.net/) on
[GitHub](https://github.com/wsdjeg).

## License

This project is licensed under the GPL-3.0 License.
