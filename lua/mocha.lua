local function win()
          print('inside a')
end

local function createFloatingWindow()
    local file = vim.fn.expand("%:p")
    local stats = vim.api.nvim_list_uis()[1]
    -- print(stats.width)
    -- print(stats.height)
    local width = stats.width
    local height = stats.height
    local height = vim.api.nvim_win_get_height(0)
    local height = vim.api.nvim_win_get_height(0)
    -- print(width)
    -- print(height)
    local bufh = vim.api.nvim_create_buf(false, true) --returns int of newly created buffer
    

    local winId = vim.api.nvim_open_win(bufh, true, {
            relative="editor",
            width = width - 85,
            height = height - 10,
            col = 4,
            row = 2,
            style="minimal",
            border="rounded"
    })
    vim.cmd('terminal')
    vim.cmd('call jobsend(b:terminal_job_id, "NODE_ENV=testing mocha --timeout 3000 --slow 0 ' .. file .. ' ../. \\n")')
end

return {
    win = win,
    createFloatingWindow = createFloatingWindow
}

