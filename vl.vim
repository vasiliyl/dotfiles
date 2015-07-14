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

hi Normal       ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6

hi Comment      ctermbg=0 ctermfg=15 guibg=#2e3436 guifg=#888a85 gui=NONE
hi Conditional  ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Constant     ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Error        ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Identifier   ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Ignore       ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Operator     ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi PreProc      ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Repeat       ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Special      ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Statement    ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi String       ctermbg=0 ctermfg=15 guibg=#2e3436 guifg=#888a85 gui=NONE
hi Title        ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Todo         ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Type         ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=NONE
hi Underlined   ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6 gui=underline

hi Cursor       ctermbg=1 guibg=#ce5c00
hi CursorLine   guibg=#212628
hi CursorLineNr ctermfg=11 guibg=#212628 guifg=#fce94f
hi Directory    ctermbg=0 ctermfg=12 guibg=#2e3436 guifg=#729fcf
hi IncSearch    ctermbg=11 ctermfg=3 guibg=#fce94f guifg=#c4a000
hi LineNr       ctermbg=0 ctermfg=8 guibg=#2e3436 guifg=#555753
hi MatchParen   ctermbg=0 ctermfg=11 guibg=#2e3436 guifg=#fce94f
hi Pmenu		ctermbg=7 ctermfg=8 guibg=#babdb6 guifg=#555753
hi PmenuSel		ctermbg=8 ctermfg=7 guibg=#555753 guifg=#babdb6
hi Search       ctermbg=11 ctermfg=3 guibg=#fce94f guifg=#c4a000
hi Visual       ctermfg=9 ctermfg=1 guibg=#fcaf3e guifg=#ce5c00

hi TabLine      ctermbg=15 ctermfg=7 guibg=#888a85 guifg=#babdb6
hi TabLineFill  ctermbg=7 guibg=#babdb6
hi TabLineSel   ctermbg=0 ctermfg=7 guibg=#2e3436 guifg=#babdb6

hi NonText      ctermbg=0 ctermfg=4 guibg=#2e3436 guifg=#3465a4
hi SpecialKey   ctermbg=0 ctermfg=12 guibg=#2e3436 guifg=#729fcf
hi Conceal      ctermbg=0 ctermfg=4 guibg=#2e3436 guifg=#3465a4

hi Folded       ctermbg=8 ctermfg=7 guibg=#555753 guifg=#babdb6
hi FoldColumn   ctermbg=0 ctermfg=15 guibg=#2e3436 guifg=#888a85

hi MarksColumn  ctermbg=0 ctermfg=2 guibg=#2e3436 guifg=#73d216

hi DiffAdd      ctermbg=0 ctermfg=10 guibg=#2e3436 guifg=#8ae234 gui=bold
hi DiffChange   ctermbg=0 ctermfg=9 guibg=#2e3436 guifg=#fcaf3e gui=bold
hi DiffDelete   ctermbg=0 ctermfg=8 guibg=#2e3436 guifg=#555753 gui=bold
hi DiffText     ctermbg=0 ctermfg=9 guibg=#2e3436 guifg=#fcaf3e gui=bold
