# code-runner.nvim

Async Code Runner for Neovim

## Install

With nvim-plug:

```lua
require('plug').add({
  {
    'wsdjeg/code-runner.nvim',
    config = function()
      require('code-runner').setup({
        runners = {
          lua = { exe = 'lua', opt = { '-' }, usestdin = true },
        },
      })
    end,
  },
})
```
