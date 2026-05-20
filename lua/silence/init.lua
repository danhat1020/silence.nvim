local M = {}

M.colors = {
  none       = 'none',
  bg         = '#0c0c0c',
  black      = '#080808',
  grey0      = '#141414',
  grey1      = '#1b1b1b',
  grey2      = '#222222',
  grey3      = '#404040',
  grey4      = '#555555',
  grey5      = '#666666',
  grey6      = '#707070',
  grey7      = '#888888',
  grey8      = '#a0a0a0',
  grey9      = '#b0b0b0',
  grey10     = '#c0c0c0',
  white      = '#d0d0d0',

  red        = '#d070a0',
  yellow     = '#d0b8a0',
  blue       = '#6090d0',
  light_blue = '#90a0d0',

  string     = '#7098a0',
  constant   = '#a890d0',
  incsearch  = '#b0b0c0',
  matchparen = '#b8c0e0',
  type       = '#90939b',
  preproc    = '#9090a0',
}

M.config = {
  transparent = false,
  bold = true,
  darker_comments = false,
}

function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend('force', M.config, opts)
end

function M.load()
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
  vim.g.colors_name = 'silence'

  if M.config.transparent then M.colors.bg = 'none' end

  local comments = M.colors.white
  if M.config.darker_comments then comments = M.colors.grey6 end

  local highlights = {
    -- Core UI
    Normal                     = { fg = M.colors.grey8, bg = M.colors.bg, },
    NormalFloat                = { fg = M.colors.none, bg = M.colors.bg, },
    FloatBorder                = { fg = M.colors.grey7, bg = M.colors.bg, },
    CursorLine                 = { fg = M.colors.none, bg = M.colors.grey0, },
    CursorLineNr               = { fg = M.colors.none, bg = M.colors.grey0, },
    CursorColumn               = { fg = M.colors.none, bg = M.colors.grey0, },
    LineNr                     = { fg = M.colors.grey9, bg = M.colors.bg, },
    LineNrAbove                = { fg = M.colors.grey4, bg = M.colors.bg, },
    LineNrBelow                = { fg = M.colors.grey4, bg = M.colors.bg, },
    ColorColumn                = { fg = M.colors.none, bg = M.colors.black, },
    Cursor                     = { reverse = true, bold = M.config.bold },
    CursorIM                   = { reverse = true, bg = M.colors.bg, },
    lCursor                    = { reverse = true, bg = M.colors.bg, },
    Visual                     = { fg = M.colors.string, bg = M.colors.grey2, },
    EndOfBuffer                = { fg = M.colors.grey3, bg = M.colors.bg, },
    VertSplit                  = { fg = M.colors.grey2, bg = M.colors.grey2, },
    -- Syntax
    Statement                  = { fg = M.colors.grey8, bg = M.colors.bg, },
    Function                   = { fg = M.colors.grey8, bg = M.colors.bg, },
    String                     = { fg = M.colors.string, bg = M.colors.bg, },
    Type                       = { fg = M.colors.type, bg = M.colors.bg, },
    Conditional                = { fg = M.colors.grey7, bg = M.colors.bg, },
    Comment                    = { fg = comments, bg = M.colors.bg, },
    Todo                       = { fg = M.colors.black, bg = comments, bold = M.config.bold },
    Special                    = { fg = M.colors.grey7, bg = M.colors.bg, },
    Delimiter                  = { fg = M.colors.grey5, bg = M.colors.bg, },
    Identifier                 = { fg = M.colors.grey8, bg = M.colors.bg, },
    Keyword                    = { fg = M.colors.grey5, bg = M.colors.bg, },
    PreProc                    = { fg = M.colors.preproc, bg = M.colors.bg, },
    Include                    = { fg = M.colors.preproc, bg = M.colors.bg, },
    Constant                   = { fg = M.colors.constant, bg = M.colors.bg, },
    Boolean                    = { fg = M.colors.grey5, bg = M.colors.bg, },
    Ignore                     = { fg = M.colors.none, bg = M.colors.bg, },
    ['@lsp.type.variable']     = { fg = M.colors.grey9, bg = M.colors.bg },
    ['@lsp.type.parameter']    = { fg = M.colors.light_blue, bg = M.colors.bg },
    -- Popup menu
    Pmenu                      = { fg = M.colors.grey5, bg = M.colors.bg, },
    PmenuSel                   = { fg = M.colors.white, bg = M.colors.black, bold = M.config.bold },
    PmenuSbar                  = { fg = M.colors.none, bg = M.colors.black, },
    PmenuThumb                 = { fg = M.colors.none, bg = M.colors.grey3, },
    -- Search & matching
    IncSearch                  = { fg = M.colors.black, bg = M.colors.incsearch, },
    Search                     = { fg = M.colors.black, bg = M.colors.white, },
    MatchParen                 = { fg = M.colors.matchparen, bg = M.colors.grey3, bold = M.config.bold },
    -- Statusline & tabs
    StatusLine                 = { fg = M.colors.grey10, bg = M.colors.grey2, },
    StatusLineNC               = { fg = M.colors.grey5, bg = M.colors.grey1, },
    TabLine                    = { fg = M.colors.grey4, bg = M.colors.grey6, underline = true },
    TabLineFill                = { fg = M.colors.grey4, bg = M.colors.bg, reverse = true },
    TabLineSel                 = { fg = M.colors.grey4, bg = M.colors.bg, },
    -- Diagnostics & messages
    ErrorMsg                   = { fg = M.colors.red, bg = M.colors.bg, bold = M.config.bold },
    WarningMsg                 = { fg = M.colors.yellow, bg = M.colors.bg, bold = M.config.bold },
    ModeMsg                    = { fg = M.colors.grey10, bg = M.colors.bg, },
    MoreMsg                    = { fg = M.colors.grey7, bg = M.colors.bg, },
    Question                   = { fg = M.colors.grey4, bg = M.colors.bg, },
    Error                      = { fg = M.colors.red, underline = true, sp = M.colors.red },
    -- Folds
    FoldColumn                 = { fg = M.colors.grey4, bg = M.colors.grey3, },
    Folded                     = { fg = M.colors.grey7, bg = M.colors.grey2, },
    -- Misc
    Directory                  = { fg = M.colors.blue, bg = M.colors.bg, },
    NonText                    = { fg = M.colors.grey7, bg = M.colors.bg, },
    SpecialKey                 = { fg = M.colors.grey3, bg = M.colors.bg, },
    SignColumn                 = { fg = M.colors.grey8, bg = M.colors.bg, },
    Title                      = { fg = M.colors.grey6, bg = M.colors.bg },
    WildMenu                   = { fg = M.colors.black, bg = M.colors.grey7, },
    Operator                   = { fg = M.colors.grey8, bg = M.colors.bg, },
    -- Spell
    SpellBad                   = { bg = M.colors.black, sp = M.colors.red, underline = true },
    SpellCap                   = { sp = M.colors.grey4, underline = true },
    SpellLocal                 = { sp = M.colors.grey3, underline = true },
    SpellRare                  = { sp = M.colors.grey6, underline = true },
    -- Quickfix
    qfFileName                 = { fg = M.colors.grey5, bg = M.colors.bg, italic = true },
    qfLineNr                   = { fg = M.colors.grey4, bg = M.colors.bg, },
    qfError                    = { fg = M.colors.grey4, bg = M.colors.black, underline = true },
    -- Taglist
    MyTagListFileName          = { fg = M.colors.grey10, bg = M.colors.grey3, },
    MyTagListTitle             = { fg = M.colors.grey5, bg = M.colors.bg, },
    -- Vim-specific
    VimError                   = { fg = M.colors.grey10, bg = M.colors.grey3, },
    -- Links
    VimCommentTitle            = { link = 'Comment' },
    netrwMarkFile              = { link = 'IncSearch' },
    -- Diagnostic highlights
    DiagnosticError            = { fg = M.colors.red, bg = M.colors.none, },
    DiagnosticWarn             = { fg = M.colors.yellow, bg = M.colors.none, },
    DiagnosticInfo             = { fg = M.colors.blue, bg = M.colors.none, },
    DiagnosticHint             = { fg = M.colors.light_blue, bg = M.colors.none, },
    DiagnosticUnderlineError   = { bg = M.colors.none, underline = true, sp = M.colors.red, },
    DiagnosticUnderlineWarn    = { bg = M.colors.none, underline = true, sp = M.colors.yellow, },
    DiagnosticUnderlineInfo    = { bg = M.colors.none, underline = true, sp = M.colors.blue, },
    DiagnosticUnderlineHint    = { bg = M.colors.none, underline = true, sp = M.colors.light_blue, },
    -- Treesitter
    ['@variable']              = { fg = M.colors.grey9, bg = M.colors.bg },
    ['@variable.builtin']      = { fg = M.colors.grey7, bg = M.colors.bg },
    ['@variable.parameter']    = { fg = M.colors.light_blue, bg = M.colors.bg },
    ['@variable.member']       = { fg = M.colors.grey8, bg = M.colors.bg },
    ['@constant']              = { fg = M.colors.constant, bg = M.colors.bg },
    ['@constant.builtin']      = { fg = M.colors.constant, bg = M.colors.bg },
    ['@module']                = { fg = M.colors.grey8, bg = M.colors.bg },
    ['@string']                = { fg = M.colors.string, bg = M.colors.bg },
    ['@string.escape']         = { fg = M.colors.grey6, bg = M.colors.bg },
    ['@comment']               = { fg = comments, bg = M.colors.bg },
    ['@keyword']               = { fg = M.colors.grey5, bg = M.colors.bg },
    ['@keyword.function']      = { fg = M.colors.grey6, bg = M.colors.bg },
    ['@keyword.return']        = { fg = M.colors.grey5, bg = M.colors.bg },
    ['@function']              = { fg = M.colors.grey8, bg = M.colors.bg },
    ['@function.builtin']      = { fg = M.colors.grey7, bg = M.colors.bg },
    ['@function.call']         = { fg = M.colors.grey8, bg = M.colors.bg },
    ['@function.method']       = { fg = M.colors.grey8, bg = M.colors.bg },
    ['@function.method.call']  = { fg = M.colors.grey8, bg = M.colors.bg },
    ['@type']                  = { fg = M.colors.type, bg = M.colors.bg },
    ['@type.builtin']          = { fg = M.colors.type, bg = M.colors.bg },
    ['@operator']              = { fg = M.colors.grey8, bg = M.colors.bg },
    ['@punctuation.bracket']   = { fg = M.colors.grey5, bg = M.colors.bg },
    ['@punctuation.delimiter'] = { fg = M.colors.grey5, bg = M.colors.bg },
    ['@tag']                   = { fg = M.colors.grey7, bg = M.colors.bg },
    ['@tag.attribute']         = { fg = M.colors.light_blue, bg = M.colors.bg },
    ['@tag.delimiter']         = { fg = M.colors.grey5, bg = M.colors.bg },
    cErrInParen                = { link = 'none' },
  }

  for group, col_opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, col_opts)
  end
end

function M.set_terminal_colors()
  vim.g.terminal_color_0  = M.colors.black      -- black
  vim.g.terminal_color_1  = M.colors.red        -- red
  vim.g.terminal_color_2  = M.colors.string     -- green
  vim.g.terminal_color_3  = M.colors.yellow     -- yellow
  vim.g.terminal_color_4  = M.colors.blue       -- blue
  vim.g.terminal_color_5  = M.colors.constant   -- magenta
  vim.g.terminal_color_6  = M.colors.string     -- cyan
  vim.g.terminal_color_7  = M.colors.grey8      -- white

  vim.g.terminal_color_8  = M.colors.grey3      -- bright black
  vim.g.terminal_color_9  = M.colors.red        -- bright red
  vim.g.terminal_color_10 = M.colors.string     -- bright green
  vim.g.terminal_color_11 = M.colors.yellow     -- bright yellow
  vim.g.terminal_color_12 = M.colors.blue       -- bright blue
  vim.g.terminal_color_13 = M.colors.constant   -- bright magenta
  vim.g.terminal_color_14 = M.colors.light_blue -- bright cyan
  vim.g.terminal_color_15 = M.colors.white      -- bright white
end

return M
