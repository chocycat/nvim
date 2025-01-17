-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic options
require("config.options")

-- Color Theme
require("colors.rukiyo")

-- Initialize lazy.nvim
require("lazy").setup("plugins")
