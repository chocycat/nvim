local opt = vim.opt

-- Disable default file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--
-- Editor settings
--

-- Tab settings (editor defaults)
-- It is recommended to include a ~/.editorconfig file.
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true

opt.number = true -- Show line numbers
opt.relativenumber = true -- Line numbers should be relative

opt.list = false -- Hide invisible characters

vim.opt.clipboard = "unnamedplus" -- Use system clipboard
