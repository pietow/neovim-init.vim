local function createFloatingWindow()
    local stats = vim.api.nvim_list_uis()[1]
    -- print(stats.width)
    -- print(stats.height)
    local width = stats.width
    local height = stats.height
    -- local height = vim.api.nvim_win_get_height(0)
    -- local height = vim.api.nvim_win_get_height(0)
    -- print(width)
    -- print(height)
    local bufh = vim.api.nvim_create_buf(false, true) --returns int of newly created buffer
    

    -- local winId = vim.api.nvim_open_win(bufh, true, {
    --         relative="editor",
    --         width = width - 10,
    --         height = height - 10,
    --         col = 4,
    --         row = 2,
    --         style="minimal",
    --         border="rounded"
    -- })
end

local function onResize()
    local stats = vim.api.nvim_list_uis()[1]
    print(stats.width)
    print(stats.height)
end


return {
    createFloatingWindow = createFloatingWindow,
    onResize = onResize
}
