return {
  cmd = { 'elspy', 'run', 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = { vim.env.VIMRUNTIME, vim.fn.stdpath('config') },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    }
  }
}
