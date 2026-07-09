-- test/setup_spec.lua
local lu = require('luaunit')
local code_runner = require('code-runner')

TestSetup = {}

function TestSetup:setUp()
    -- Reset to known state before each test
    code_runner.setup({
        runners = {
            lua = { exe = 'lua', opt = { '-' }, usestdin = true },
            python = 'python3 %s',
        },
        enter_win = false,
    })
end

function TestSetup:testSetupRunners()
    -- Verify runners are registered after setup
    local lua_runner = code_runner.get('lua')
    lu.assertNotNil(lua_runner)
    lu.assertEquals(type(lua_runner), 'table')
    lu.assertEquals(lua_runner.exe, 'lua')
    lu.assertEquals(lua_runner.usestdin, true)
end

function TestSetup:testSetupStringRunner()
    local python_runner = code_runner.get('python')
    lu.assertEquals(python_runner, 'python3 %s')
end

function TestSetup:testGetNonExistentRunner()
    local result = code_runner.get('nonexistent_ft')
    lu.assertEquals(result, '')
end

function TestSetup:testSetupEnterWin()
    -- Default setup uses enter_win = false
    code_runner.setup({
        runners = {},
        enter_win = true,
    })
    -- No crash means success; enter_win is internal
    lu.assertTrue(true)
end

function TestSetup:testSetupEmptyOpt()
    code_runner.setup({})
    -- Should not crash with empty config
    lu.assertTrue(true)
end

function TestSetup:testSetupOverwriteRunner()
    code_runner.setup({
        runners = {
            lua = 'lua %s',
        },
        enter_win = false,
    })
    local lua_runner = code_runner.get('lua')
    lu.assertEquals(lua_runner, 'lua %s')
end

function TestSetup:testSetupMultipleRunners()
    code_runner.setup({
        runners = {
            lua = 'lua %s',
            python = 'python3 %s',
            sh = 'sh %s',
            go = 'go run %s',
        },
        enter_win = false,
    })
    lu.assertEquals(code_runner.get('lua'), 'lua %s')
    lu.assertEquals(code_runner.get('python'), 'python3 %s')
    lu.assertEquals(code_runner.get('sh'), 'sh %s')
    lu.assertEquals(code_runner.get('go'), 'go run %s')
end

return TestSetup

