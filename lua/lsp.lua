vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf, desc = "Go to references" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf, desc = "LSP Hover" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename symbol" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf, desc = "Code action" })
  end
})

vim.diagnostic.config({
  virtual_lines = true,
})
vim.diagnostic.enable();

vim.lsp.enable('lua')
vim.lsp.enable('typescript')
vim.lsp.enable('unocss')
vim.lsp.enable('biome')
vim.lsp.enable('solargraph')
vim.lsp.enable('rust')
