-- test/minimal_init.lua
-- Minimal Neovim configuration for testing

print('Initializing test environment...')

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.verbose = 1

-- package.path:
-- 1. lua/?.lua       - Main plugin source code
-- 2. test/?.lua       - Test modules
-- 3. test/.deps/?.lua - Test dependencies (luaunit, job mock, notify mock, logger mock)
package.path = 'lua/?.lua;test/?.lua;test/.deps/?.lua;' .. package.path
vim.opt.runtimepath:prepend('.')

-- Load plugin with test configuration
local ok, err = pcall(function()
    require('code-runner').setup({
        runners = {
            lua = { exe = 'lua', opt = { '-' }, usestdin = true },
            python = 'python3 %s',
        },
        enter_win = false,
    })
end)

if not ok then
    print('Error initializing test environment: ' .. err)
else
    print('Test environment initialized successfully')
end

