local opt = vim.opt

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable default file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Unbind unconditional binds
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'gO')
vim.keymap.del('n', 'gcc')

-- Tab settings (editor defaults)
-- It is recommended to include a ~/.editorconfig file.
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true

opt.number = true                                                      -- Show line numbers
opt.relativenumber = true                                              -- Line numbers should be relative

opt.list = false                                                       -- Hide invisible characters

vim.opt.clipboard = "unnamedplus"                                      -- Use system clipboard

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true }) -- Clear highlight on <Esc>

if vim.g.neovide then
  vim.o.guifont = "Fairfax Hax:h13"
  vim.g.neovide_padding_top = 8
  vim.g.neovide_padding_bottom = 8
  vim.g.neovide_padding_left = 8
  vim.g.neovide_padding_right = 8
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
