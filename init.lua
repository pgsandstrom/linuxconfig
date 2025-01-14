-- bootstrap lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- load plugins with lazy package manager
require("lazy").setup({
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})

-- Share clipboard with the OS
vim.opt.clipboard:append("unnamedplus")
vim.opt.ignorecase = true

-- Prevent `O` from copying `//` if standing on a commented line
-- It does have the problem that indentation is not preserved, but I guess thats ok
vim.api.nvim_set_keymap('n', 'O', '<cmd>set paste<CR>O<Esc><cmd>set nopaste<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', '<cmd>set paste<CR>o<Esc><cmd>set nopaste<CR>a', { noremap = true, silent = true })
