local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
            opts = {
                colorscheme = "catppuccin",
            },
        },
        {
            import = "plugins",
        },
    },
    install = {
        colorscheme = {
            "catppuccin",
            "habamax",
        },
    },
    checker = {
        enabled = true,
        notify = false,
    },
})
