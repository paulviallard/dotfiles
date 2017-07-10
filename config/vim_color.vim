" Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
" This work is free. You can redistribute it and/or modify it under the
" terms of the Do What The Fuck You Want To Public License, Version 2,
" as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "paulviallard"

set guifont=Monaco:h12
hi Normal guifg=white guibg=#2e3947 ctermfg=white

" Syntax colors
hi Comment guifg=#65c7c1 gui=bold ctermfg=cyan
hi Constant guifg=#e172dd ctermfg=magenta cterm=bold
hi Identifier guifg=#6da9db ctermfg=blue
hi Function guifg=white ctermfg=white
hi Statement guifg=#fed02d gui=bold ctermfg=yellow cterm=bold
hi Preproc guifg=#6da9db ctermfg=blue
hi Type guifg=#bef26b gui=bold ctermfg=green
hi Special guifg=#ffe071 ctermfg=yellow
hi Underlined guifg=#509cda gui=bold,underline ctermfg=blue cterm=bold,underline
hi Ignore guifg=white gui=italic ctermfg=white cterm=italic
hi Error guifg=white guibg=#c24136 gui=bold ctermfg=white ctermbg=red cterm=bold
hi Todo guifg=black guibg=#fed02d gui=bold ctermfg=black ctermbg=yellow cterm=bold
hi LineNr guifg=#dadada ctermfg=white cterm=bold
hi MatchParen guifg=white guibg=#c24136 gui=bold ctermfg=white ctermbg=red cterm=bold
hi NonText guifg=white ctermfg=white
hi Directory guifg=#bef26b ctermfg=green
