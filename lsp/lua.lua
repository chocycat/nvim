return {
  cmd = { vim.fn.expand('~/.elspy/downloads/lua_language_server/bin/lua-language-server'), '--stdio' },
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
