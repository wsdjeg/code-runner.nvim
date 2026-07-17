-- test/example_spec.lua
-- Example test file demonstrating the testing pattern

local lu = require('luaunit')
local code_runner = require('code-runner')

TestExample = {}

function TestExample:setUp()
    code_runner.setup({
        runners = {
            lua = { exe = 'lua', opt = { '-' }, usestdin = true },
            python = 'python3 %s',
        },
        enter_win = false,
    })
end

function TestExample:testModuleIsAvailable()
    lu.assertNotNil(code_runner)
    lu.assertEquals(type(code_runner), 'table')
end

function TestExample:testApiFunctionsExist()
    lu.assertEquals(type(code_runner.setup), 'function')
    lu.assertEquals(type(code_runner.open), 'function')
    lu.assertEquals(type(code_runner.close), 'function')
    lu.assertEquals(type(code_runner.get), 'function')
    lu.assertEquals(type(code_runner.run_task), 'function')
    lu.assertEquals(type(code_runner.select_file), 'function')
    lu.assertEquals(type(code_runner.status), 'function')
end

function TestExample:testGetReturnsRunnerForKnownFt()
    local runner = code_runner.get('lua')
    lu.assertNotNil(runner)
    lu.assertEquals(type(runner), 'table')
end

function TestExample:testGetReturnsEmptyStringForUnknownFt()
    local runner = code_runner.get('nonexistent')
    lu.assertEquals(runner, '')
end

function TestExample:testStatusReturnsValidString()
    local status = code_runner.status()
    lu.assertEquals(type(status), 'string')
    lu.assertTrue(#status > 0)
end

return TestExample

