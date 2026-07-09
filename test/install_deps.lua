-- test/install_deps.lua
-- Cross-platform test dependency installer

local function mkdir(path)
    vim.fn.mkdir(path, 'p')
end

local function file_exists(path)
    return vim.fn.filereadable(path) == 1
end

local function download(url, dest)
    local has_curl = vim.fn.executable('curl') == 1
    if has_curl then
        local cmd = { 'curl', '-fsSL', url, '-o', dest }
        vim.fn.system(cmd)
        return vim.v.shell_error == 0
    end

    if vim.fn.has('win32') == 1 then
        local ps_cmd = string.format("Invoke-WebRequest -Uri '%s' -OutFile '%s'", url, dest)
        vim.fn.system({ 'powershell', '-Command', ps_cmd })
        return vim.v.shell_error == 0
    end

    local has_wget = vim.fn.executable('wget') == 1
    if has_wget then
        local cmd = { 'wget', '-q', url, '-O', dest }
        vim.fn.system(cmd)
        return vim.v.shell_error == 0
    end

    return false
end

local deps_dir = 'test/.deps'
mkdir(deps_dir)

-- Install luaunit
local luaunit_path = deps_dir .. '/luaunit.lua'
local luaunit_url = 'https://raw.githubusercontent.com/bluebird75/luaunit/main/luaunit.lua'

if file_exists(luaunit_path) then
    print('luaunit already installed')
else
    print('Installing luaunit...')
    if download(luaunit_url, luaunit_path) then
        print('luaunit installed to ' .. luaunit_path)
    else
        print('[ERROR] Failed to download luaunit')
        os.exit(1)
    end
end

-- Install job.nvim mock
local job_path = deps_dir .. '/job.lua'
local job_url = 'https://raw.githubusercontent.com/wsdjeg/job.nvim/refs/heads/master/lua/job/init.lua'

if file_exists(job_path) then
    print('job.nvim already installed')
else
    print('Installing job.nvim...')
    if download(job_url, job_path) then
        print('job.nvim installed to ' .. job_path)
    else
        print('[ERROR] Failed to download job.nvim')
        os.exit(1)
    end
end

-- Create notify mock
local notify_path = deps_dir .. '/notify.lua'
if file_exists(notify_path) then
    print('notify mock already installed')
else
    print('Creating notify mock...')
    local notify_content = [=[
-- Minimal mock for notify.nvim used in tests
local M = {}
function M.notify(msg, ...)
    -- no-op: silently swallow notifications during tests
end
return M
]=]
    local f = io.open(notify_path, 'w')
    if f then
        f:write(notify_content)
        f:close()
        print('notify mock created at ' .. notify_path)
    else
        print('[ERROR] Failed to create notify mock')
        os.exit(1)
    end
end

-- Create logger mock
local logger_path = deps_dir .. '/logger.lua'
if file_exists(logger_path) then
    print('logger mock already installed')
else
    print('Creating logger mock...')
    local logger_content = [=[
-- Minimal mock for logger module used in tests
local M = {}
function M.derive(name)
    local derived = {}
    for _, level in ipairs({ 'info', 'debug', 'warn', 'error' }) do
        derived[level] = function(msg)
            -- no-op
        end
    end
    return derived
end
return M
]=]
    local f = io.open(logger_path, 'w')
    if f then
        f:write(logger_content)
        f:close()
        print('logger mock created at ' .. logger_path)
    else
        print('[ERROR] Failed to create logger mock')
        os.exit(1)
    end
end

print('All dependencies installed.')
os.exit(0)

