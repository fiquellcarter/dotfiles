local FiquellCarterGroup = vim.api.nvim_create_augroup("FiquellCarter", {})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = FiquellCarterGroup,
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
