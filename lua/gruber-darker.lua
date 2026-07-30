-- gruber-darker.nvim: Gruber Darker color scheme for Neovim.

-- Neovim port & extension:
-- Copyright (C) 2026 boon (0x45454545)

-- Based on the Gruber Darker theme for Emacs:
-- Copyright (C) 2013-2016 Alexey Kutepov a.k.a rexim
-- Copyright (C) 2009-2010 Jason R. Blevins

-- Original:
-- https://github.com/rexim/gruber-darker-theme

-- Permission is hereby granted, free of charge, to any person
-- obtaining a copy of this software and associated documentation
-- files (the "Software"), to deal in the Software without
-- restriction, including without limitation the rights to use, copy,
-- modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
-- BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
-- ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
-- CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-- Commentary:
--
-- Gruber Darker color theme for Emacs by Jason Blevins. A darker
-- variant of the Gruber Dark theme for BBEdit by John Gruber. Adapted
-- for deftheme and extended by Alexey Kutepov a.k.a. rexim.
--
-- Ported and extended for Neovim by boon (0x45454545).

local theme = { }

theme.palette = {

    fg        = "#e4e4ef",
    fgl1      = "#f4f4ff",
    fgl2      = "#f5f5f5",

    white     = "#ffffff",
    black     = "#000000",

    bgd1      = "#101010",
    bg        = "#181818",
    bgl1      = "#282828",
    bgl2      = "#453d41",
    bgl3      = "#484848",
    bgl4      = "#52494e",

    redd1     = "#c73c3f",
    red       = "#f43841",
    redl1     = "#ff4f58",

    green     = "#73c936",
    yellow    = "#ffdd33",
    brown     = "#cc8c3c",
    quartz    = "#95a99f",

    niagarad2 = "#303540",
    niagarad1 = "#565f73",
    niagara   = "#96a6c8",

    wisteria  = "#9e95c7",

}

theme.ui = {

    Normal         = { fg = theme.palette.fg, bg = theme.palette.bg },
    NormalFloat    = { fg = theme.palette.fg, bg = theme.palette.bg },

    Cursor         = { bg = theme.palette.yellow },

    CursorLine     = { bg = theme.palette.bg },
    CursorColumn   = { bg = theme.palette.bgl1 },

    ColorColumn    = { bg = theme.palette.bgd1 },

    LineNr         = { fg = theme.palette.bgl4 },
    CursorLineNr   = { fg = theme.palette.yellow },

    SignColumn     = { bg = theme.palette.bg },

    EndOfBuffer    = { fg = theme.palette.yellow },

    Visual         = { bg = theme.palette.bgl1 },

    Search         = { fg = theme.palette.black, bg = theme.palette.yellow },
    IncSearch      = { fg = theme.palette.black, bg = theme.palette.white },

    MatchParen     = { fg = theme.palette.yellow, bold = true },

    StatusLine     = { fg = theme.palette.fgl1, bg = theme.palette.bgl1 },
    StatusLineNC   = { fg = theme.palette.quartz, bg = theme.palette.bgl1 },

    Pmenu          = { fg = theme.palette.fg, bg = theme.palette.bgl1 },
    PmenuSel       = { fg = theme.palette.black, bg = theme.palette.yellow },

    WinSeparator   = { fg = theme.palette.bgl3 },

    Directory      = { fg = theme.palette.niagara },

    ModeMsg        = { fg = theme.palette.yellow },
    MoreMsg        = { fg = theme.palette.yellow },

    ErrorMsg       = { fg = theme.palette.red },
    WarningMsg     = { fg = theme.palette.brown },

    DiffAdd        = { bg = theme.palette.green },
    DiffDelete     = { bg = theme.palette.red },
    DiffChange     = { bg = theme.palette.niagarad1 },
    DiffText       = { bg = theme.palette.yellow },

}

theme.syntax = {

    Comment        = { fg = theme.palette.brown },
    SpecialComment = { link = "Comment" },

    String         = { fg = theme.palette.green },
    Character      = { link = "String" },

    Number         = { fg = theme.palette.fg },
    Float          = { link = "Number" },
    Boolean        = { link = "Number" },
    Constant       = { fg = theme.palette.fg },

    Identifier     = { fg = theme.palette.fg },

    Function       = { fg = theme.palette.niagara },

    Keyword        = { fg = theme.palette.yellow },
    Statement      = { link = "Keyword" },
    Conditional    = { link = "Keyword" },
    Repeat         = { link = "Keyword" },
    Exception      = { link = "Keyword" },

    PreProc        = { fg = theme.palette.quartz },
    Include        = { link = "PreProc" },
    Define         = { link = "PreProc" },
    Macro          = { link = "PreProc" },

    Type           = { fg = theme.palette.quartz },
    Structure      = { fg = theme.palette.yellow },
    Typedef        = { fg = theme.palette.yellow },
    StorageClass   = { fg = theme.palette.yellow },

    Operator       = { fg = theme.palette.fg },
    Delimiter      = { fg = theme.palette.fg },
    Special        = { fg = theme.palette.fg },
    SpecialChar    = { fg = theme.palette.green },

    Todo           = { fg = theme.palette.yellow, bold = true },
    Error          = { fg = theme.palette.red, bold = true },

}

theme.style = { default = 0, modern = 1 }

function theme.load(style)

    vim.cmd("highlight clear")

    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    vim.g.colors_name = "gruber-darker"

    if style == theme.style.modern then

        theme.syntax["Number"]       = { fg = theme.palette.quartz }
        theme.syntax["Constant"]     = { fg = theme.palette.quartz }
        theme.syntax["Special"]      = { fg = theme.palette.yellow }
        theme.syntax["SpecialChar"]  = { fg = theme.palette.red }

        -- req: tree-sitter

        theme.syntax["@function.builtin"] = { fg = theme.palette.yellow }
        theme.syntax["@constant.builtin"] = { fg = theme.palette.yellow }
        theme.syntax["@type.builtin"]     = { fg = theme.palette.yellow }
        theme.syntax["@attribute"]        = { fg = theme.palette.yellow }

        theme.syntax["@variable.member"]  = { fg = theme.palette.wisteria }
        theme.syntax["@property"]         = { fg = theme.palette.wisteria }

        theme.syntax["@constructor"]      = { fg = theme.palette.quartz }

    end

    for _, group in next, { theme.ui, theme.syntax } do
        for name, options in next, group do
            vim.api.nvim_set_hl(0, name, options)
        end
    end

end

return theme
