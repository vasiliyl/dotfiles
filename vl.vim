" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

" Set our own highlighting settings

hi Normal       guibg=#2e3436 guifg=#babdb6

hi Comment      guibg=#2e3436 guifg=#888a85 gui=NONE
hi Conditional  guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Constant     guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Error        guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Identifier   guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Ignore       guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Operator     guibg=#2e3436 guifg=#babdb6 gui=NONE
hi PreProc      guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Repeat       guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Special      guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Statement    guibg=#2e3436 guifg=#babdb6 gui=NONE
hi String       guibg=#2e3436 guifg=#888a85 gui=NONE
hi Title        guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Todo         guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Type         guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Underlined   guibg=#2e3436 guifg=#babdb6 gui=underline

hi Cursor       guibg=#ce5c00
hi CursorLine   guibg=#212628
hi CursorLineNr guibg=#212628 guifg=#fce94f
hi Directory    guibg=#2e3436 guifg=#729fcf
hi IncSearch    guibg=#fce94f guifg=#c4a000
hi LineNr       guibg=#2e3436 guifg=#555753
hi MatchParen   guibg=#2e3436 guifg=#fce94f
hi Pmenu		guibg=#babdb6 guifg=#555753
hi PmenuSel		guibg=#555753 guifg=#babdb6
hi Search       guibg=#fce94f guifg=#c4a000
hi Visual       guibg=#fcaf3e guifg=#ce5c00
hi TabLine      guibg=#888a85 guifg=#babdb6
hi TabLineFill  guibg=#babdb6
hi TabLineSel   guibg=#2e3436 guifg=#babdb6
hi NonText      guibg=#2e3436 guifg=#3465a4
hi SpecialKey   guibg=#2e3436 guifg=#729fcf
hi Conceal      guibg=#2e3436 guifg=#3465a4

hi DiffAdd      guibg=#2e3436 guifg=#8ae234 gui=bold
hi DiffChange   guibg=#2e3436 guifg=#fcaf3e gui=bold
hi DiffDelete   guibg=#2e3436 guifg=#555753 gui=bold
hi DiffText     guibg=#2e3436 guifg=#fcaf3e gui=bold
