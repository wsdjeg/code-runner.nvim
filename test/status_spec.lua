-- test/status_spec.lua
local lu = require('luaunit')
local code_runner = require('code-runner')

TestStatus = {}

function TestStatus:setUp()
    code_runner.setup({
        runners = {
            lua = { exe = 'lua', opt = { '-' }, usestdin = true },
        },
        enter_win = false,
    })
end

function TestStatus:testStatusReturnsString()
    local status = code_runner.status()
    lu.assertEquals(type(status), 'string')
end

function TestStatus:testStatusFormat()
    local status = code_runner.status()
    -- Should match " X running, Y done" format
    lu.assertStrMatches(status, '%s+%d+ running, %d+ done')
end

function TestStatus:testStatusNoRunningTasks()
    local status = code_runner.status()
    -- With no tasks running, running count should be 0
    lu.assertStrContains(status, '0 running')
end

return TestStatus

