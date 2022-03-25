local api = vim.api
-- local M = {}
-- function M.create_window()
--     print("Hello World!")
-- end
-- return M
-- local popup = require("plenary.popup")
local M = {}
function M.create_window()
    print("Hello World2!")
    -- log.trace("_create_window()")
    -- local config = harpoon.get_menu_config()
    -- local width = config.width or 60
    -- local height = config.height or 10
    -- local borderchars = config.borderchars
    --     or { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    -- local bufnr = vim.api.nvim_create_buf(false, false)

    -- local Harpoon_win_id, win = popup.create(bufnr, {
    --     title = "Harpoon",
    --     highlight = "HarpoonWindow",
    --     line = math.floor(((vim.o.lines - height) / 2) - 1),
    --     col = math.floor((vim.o.columns - width) / 2),
    --     minwidth = width,
    --     minheight = height,
    --     borderchars = borderchars,
    -- })

    -- vim.api.nvim_win_set_option(
    --     win.border.win_id,
    --     "winhl",
    --     "Normal:HarpoonBorder"
    -- )
    -- print(Harpoon_win_id)

    -- return {
    --     bufnr = bufnr,
    --     win_id = Harpoon_win_id,
    -- }
end
return M
