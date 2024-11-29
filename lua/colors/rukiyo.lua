vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "rukiyo"

local colors = {
  base00 = "#232032", -- bg
  base01 = "#2b283b", -- lighter bg
  base02 = "#342f45", -- selection bg
  base03 = "#9d94c7", -- comments
  base04 = "#bbb5d4", -- dark fg
  base05 = "#e6e3f4", -- fg
  base06 = "#d5d0ea", -- light fg
  base07 = "#fbfaff", -- lighter fg
  base08 = "#d4b0c7", -- variables
  base09 = "#d5bc95", -- constants
  base0A = "#e2ccd0", -- classes
  base0B = "#aed4b9", -- strings
  base0C = "#b4a0d4", -- regex/support
  base0D = "#98a4ff", -- functions
  base0E = "#d3a0e6", -- keywords
  base0F = "#d7bdef", -- deprecated
}

local function set_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- terminal colors
-- TODO: automate this
vim.g.terminal_color_0 = colors.base00
vim.g.terminal_color_1 = colors.base08
vim.g.terminal_color_2 = colors.base0B
vim.g.terminal_color_3 = colors.base0A
vim.g.terminal_color_4 = colors.base0D
vim.g.terminal_color_5 = colors.base0E
vim.g.terminal_color_6 = colors.base0C
vim.g.terminal_color_7 = colors.base05
vim.g.terminal_color_8 = colors.base03
vim.g.terminal_color_9 = colors.base08
vim.g.terminal_color_10 = colors.base0B
vim.g.terminal_color_11 = colors.base0A
vim.g.terminal_color_12 = colors.base0D
vim.g.terminal_color_13 = colors.base0E
vim.g.terminal_color_14 = colors.base0C
vim.g.terminal_color_15 = colors.base07

-- editor colors
set_hl("Normal", { fg = colors.base05, bg = colors.base00 })
set_hl("Bold", { bold = true })
set_hl("Debug", { fg = colors.base08 })
set_hl("Directory", { fg = colors.base0D })
set_hl("Error", { fg = colors.base00, bg = colors.base08 })
set_hl("ErrorMsg", { fg = colors.base08, bg = colors.base00 })
set_hl("Exception", { fg = colors.base08 })
set_hl("FoldColumn", { fg = colors.base0C, bg = colors.base01 })
set_hl("Folded", { fg = colors.base03, bg = colors.base01 })
set_hl("IncSearch", { fg = colors.base01, bg = colors.base09 })
set_hl("Italic", { italic = true })
set_hl("Macro", { fg = colors.base08 })
set_hl("MatchParen", { bg = colors.base03 })
set_hl("ModeMsg", { fg = colors.base0B })
set_hl("MoreMsg", { fg = colors.base0B })
set_hl("Question", { fg = colors.base0D })
set_hl("Search", { fg = colors.base01, bg = colors.base0A })
set_hl("Substitute", { fg = colors.base01, bg = colors.base0A })
set_hl("SpecialKey", { fg = colors.base03 })
set_hl("TooLong", { fg = colors.base08 })
set_hl("Underlined", { fg = colors.base08 })
set_hl("Visual", { bg = colors.base02 })
set_hl("VisualNOS", { fg = colors.base08 })
set_hl("WarningMsg", { fg = colors.base08 })
set_hl("WildMenu", { fg = colors.base08, bg = colors.base0A })
set_hl("Title", { fg = colors.base0D })
set_hl("Conceal", { fg = colors.base0D, bg = colors.base00 })
set_hl("Cursor", { fg = colors.base00, bg = colors.base05 })
set_hl("NonText", { fg = colors.base03 })
set_hl("LineNr", { fg = colors.base03, bg = colors.base00 })
set_hl("SignColumn", { fg = colors.base03, bg = colors.base00 })
set_hl("StatusLine", { fg = colors.base04, bg = colors.base02 })
set_hl("StatusLineNC", { fg = colors.base03, bg = colors.base01 })
set_hl("VertSplit", { fg = colors.base02, bg = colors.base02 })
set_hl("ColorColumn", { bg = colors.base01 })
set_hl("CursorColumn", { bg = colors.base01 })
set_hl("CursorLine", { bg = colors.base01 })
set_hl("CursorLineNr", { fg = colors.base04, bg = colors.base01 })
set_hl("QuickFixLine", { bg = colors.base01 })
set_hl("PMenu", { fg = colors.base05, bg = colors.base01 })
set_hl("PMenuSel", { fg = colors.base01, bg = colors.base05 })
set_hl("TabLine", { fg = colors.base03, bg = colors.base01 })
set_hl("TabLineFill", { fg = colors.base03, bg = colors.base01 })
set_hl("TabLineSel", { fg = colors.base0B, bg = colors.base01 })

-- syntax highlighting
set_hl("Boolean", { fg = colors.base09 })
set_hl("Character", { fg = colors.base08 })
set_hl("Comment", { fg = colors.base03 })
set_hl("Conditional", { fg = colors.base0E })
set_hl("Constant", { fg = colors.base09 })
set_hl("Define", { fg = colors.base0E })
set_hl("Delimiter", { fg = colors.base0F })
set_hl("Float", { fg = colors.base09 })
set_hl("Function", { fg = colors.base0D })
set_hl("Identifier", { fg = colors.base08 })
set_hl("Include", { fg = colors.base0D })
set_hl("Keyword", { fg = colors.base0E })
set_hl("Label", { fg = colors.base0A })
set_hl("Number", { fg = colors.base09 })
set_hl("Operator", { fg = colors.base05 })
set_hl("PreProc", { fg = colors.base0A })
set_hl("Repeat", { fg = colors.base0A })
set_hl("Special", { fg = colors.base0C })
set_hl("SpecialChar", { fg = colors.base0F })
set_hl("Statement", { fg = colors.base08 })
set_hl("StorageClass", { fg = colors.base0A })
set_hl("String", { fg = colors.base0B })
set_hl("Structure", { fg = colors.base0E })
set_hl("Tag", { fg = colors.base08 })
set_hl("Todo", { fg = colors.base0A, bg = colors.base01 })
set_hl("Type", { fg = colors.base0A })
set_hl("Typedef", { fg = colors.base0A })

-- popups, floating windows
set_hl("NormalFloat", { fg = colors.base05, bg = colors.base01 })
set_hl("FloatBorder", { fg = colors.base03, bg = colors.base01 })

-- popup menu
set_hl("Pmenu", { fg = colors.base05, bg = colors.base01 }) -- Popup menu normal item
set_hl("PmenuSel", { fg = colors.base05, bg = colors.base02 }) -- Selected item
set_hl("PmenuSbar", { bg = colors.base01 }) -- Scrollbar
set_hl("PmenuThumb", { bg = colors.base03 }) -- Thumb of scrollbar

-- misc.
set_hl("MasonNormal", { link = "NormalFloat" })
set_hl("MasonHeader", { fg = colors.base0D, bg = colors.base01, bold = true })
set_hl("MasonHeaderSecondary", { fg = colors.base0E, bg = colors.base01, bold = true })
set_hl("DiagnosticFloat", { link = "NormalFloat" })
set_hl("DiagnosticFloatingWarn", { fg = colors.base09, bg = colors.base01 })
set_hl("DiagnosticFloatingError", { fg = colors.base08, bg = colors.base01 })
set_hl("DiagnosticFloatingInfo", { fg = colors.base0D, bg = colors.base01 })
set_hl("DiagnosticFloatingHint", { fg = colors.base0C, bg = colors.base01 })
