-- test/utils_spec.lua
local lu = require('luaunit')
local util = require('code-runner.utils')

TestUtils = {}

function TestUtils:testTrimWhitespace()
    lu.assertEquals(util.trim('  hello  '), 'hello')
    lu.assertEquals(util.trim('\tworld\t'), 'world')
    lu.assertEquals(util.trim(''), '')
    lu.assertEquals(util.trim('   '), '')
end

function TestUtils:testTrimNoWhitespace()
    lu.assertEquals(util.trim('hello'), 'hello')
end

function TestUtils:testUnifyPathDefault()
    local result = util.unify_path('/tmp/test.lua')
    lu.assertNotNil(result)
    lu.assertStrContains(result, 'test.lua')
end

function TestUtils:testUnifyPathWithExplicitMod()
    local result = util.unify_path('/tmp/test.lua', ':p')
    lu.assertNotNil(result)
    lu.assertStrContains(result, 'test.lua')
end

function TestUtils:testUnifyPathDirectory()
    -- Directory paths should end with /
    local tmpdir = '/tmp/code_runner_test_dir'
    vim.fn.mkdir(tmpdir, 'p')
    local result = util.unify_path(tmpdir)
    lu.assertEquals(string.sub(result, -1), '/')
    vim.fn.delete(tmpdir, 'rf')
end

function TestUtils:testUnifyPathTrailingSlash()
    local result = util.unify_path('/tmp/test/')
    -- Should preserve trailing slash for paths ending with /
    lu.assertEquals(string.sub(result, -1), '/')
end

function TestUtils:testUnifyPathBackslashToSlash()
    local result = util.unify_path('tmp\\test.lua', ':p')
    -- Backslashes should be converted to forward slashes
    lu.assertEquals(string.find(result, '\\'), nil)
end

return TestUtils

