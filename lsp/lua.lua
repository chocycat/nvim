return {
  cmd = { 'elspy', 'run', 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim", "awful", "SUPER_KEY", "awesome", "button", "dbus", "drawable", "drawin", "key", "keygrabber", "mousegrabber", "selection", "tag", "window", "table.unpack", "math.atan2", "screen", "mouse", "root", "client" } },
      workspace = {
        library = { "/usr/share/awesome/lib", vim.env.VIMRUNTIME, vim.fn.stdpath('config') },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    }
  }
}
