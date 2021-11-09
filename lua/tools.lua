local api = vim.api
local M = {}
function M.makeScratch()
    --get current location --
    local lineNum,col = unpack(vim.api.nvim_win_get_cursor(0))

    --get above line --
    local content = vim.api.nvim_buf_get_lines(0, lineNum - 2, vim.api.nvim_buf_line_count(0), false)
    content = unpack(content) 

    --get whitespaces--
    b, e, c = string.find(content, '^(%s*)')

    --generate same amount of whitespaces--
    local str = ""
    for i = 1, e + 1 do
        str = str .. ' '
    end

    --insert whitespaces and set cursor--
    vim.api.nvim_set_current_line(str)
    vim.api.nvim_win_set_cursor(0, {lineNum, e})

    --after cursor is set go to insert mode--
    local result = vim.api.nvim_exec(
    [[

        function! MyFunction()
        startinsert 

        endfunction

        call MyFunction()
    ]],
    true)
end
return M
