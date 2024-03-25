" Copyright © 2019 Paul Viallard <paul.viallard@gmail.com>
" This work is free. You can redistribute it and/or modify it under the
" terms of the Do What The Fuck You Want To Public License, Version 2,
" as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

set nocompatible
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on

" We enable the mouse
set mouse=a
" We set the name of the terminal for the mouse codes
set ttymouse=xterm2
" We enable the line numbers
set nu
" We remove the swap files
set noswapfile

" We don't hide the mouse (in gvim)
set nomousehide

" Tab rule
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Indentation
set backspace=indent,eol,start
set smartindent
set autoindent 

" We set the split rules
set splitbelow
set splitright

" Clipboard
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" --------------------------------------------- "
"                 Customization                 "
" --------------------------------------------- "

" We customize the colors
colorscheme paulviallard

" We customize the statusbar
if has("statusline")
  set laststatus=2
  set statusline =%F
  set statusline +=\ \ 
  set statusline +=%l:%c
  set statusline +=\ \ 
  set statusline +=%y%m%r
endif

" --------------------------------------------- "
"                     Mappings                  "
" --------------------------------------------- "

" We bind the undo commands
nnoremap <C-z> <nop>
vnoremap <C-z> <nop>
inoremap <C-z> <nop>
nnoremap <C-z> u
vnoremap <C-z> u
inoremap <C-z> <C-O>u

" We bind the redo commands
nnoremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" We bind the copy/paste/cut commands
vnoremap <C-c> y
nnoremap <C-v> p
inoremap <C-v> <ESC>pi
vnoremap <C-x> x

" We bind the backspace
vnoremap <BS> x
nnoremap <BS> x

" We bind the cursor move command
nnoremap <S-TAB> <C-w>w
vnoremap <S-TAB> <C-w>w
inoremap <S-TAB> <C-w>w

" We bind the window move commands
nnoremap <S-LEFT> <C-w>H
vnoremap <S-LEFT> <C-w>H
inoremap <S-LEFT> <C-w>H
nnoremap <S-RIGHT> <C-w>L
vnoremap <S-RIGHT> <C-w>L
inoremap <S-RIGHT> <C-w>L
nnoremap <S-UP> <C-w>K
vnoremap <S-UP> <C-w>K
inoremap <S-UP> <C-w>K
nnoremap <S-DOWN> <C-w>J
vnoremap <S-DOWN> <C-w>J
inoremap <S-DOWN> <C-w>J

" --------------------------------------------- "
"                   NERD Plugins                "
" --------------------------------------------- "

" ------------------ NERDTree ----------------- "

" We set the window position
let g:NERDTreeWinPos = "left"

" We define a function to handle NERDTree when entering in vim
autocmd VimEnter * call ManageNERDTreeEnter()
function ManageNERDTreeEnter()
  " If the file is not a manual,
  if &filetype != "man"
    " we launch nerd tree
    NERDTree
    " and we change the active window
    :wincmd l
  endif
endfunction

" We define a function to handle NERDTree when entering in a window
autocmd WinEnter * call ManageNERDTree()
function ManageNERDTree()
  " If only the NERDTree window is opened,
  if winnr('$') == 1 && @% == t:NERDTreeBufName
    " we quit vim
    quit
  endif
  " If the NERDTree window is not opened, we launch it
  if (!exists("t:NERDTreeBufName")) || bufwinnr(t:NERDTreeBufName) == -1
    NERDTree
  endif 
endfunction

" -------------- NERDCommenter ---------------- "

" We add spaces between the text to comment and the symbol
let g:NERDSpaceDelims = 1
" We use the sexy multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" We enable to comment empty lines
let g:NERDCommentEmptyLines = 1
" We remove the extra whiteshape when we uncomment
let g:NERDTrimTrailingWhitespace = 1

" We bind the comment command
inoremap <C-t> <ESC>:call nerdcommenter#Comment(0, 'toggle')<CR>
nnoremap <C-t> :call nerdcommenter#Comment(1, 'toggle')<CR>
vnoremap <C-t> :call nerdcommenter#Comment(0, 'toggle')<CR>

" --------------------------------------------- "
"                       LaTeX                   "
" --------------------------------------------- "

" We launch the following function on startup
autocmd VimEnter * call ManageVimLatexPreviewEnter()

function CompilePreviewLatex()
  " We compile the file
  :!latexmk -pdf %
  " and we open the new pdf
  :let @r = substitute(expand('%:t'), '\.tex$', '.pdf', '')
  :execute '!open ' . @r
endfunction

function ManageVimLatexPreviewEnter()
  " If the file is a TeX file,
  if &filetype == "tex"
    " we launch the preview
    :call CompilePreviewLatex()
    " and we bind the preview command
    nnoremap <C-p> :call CompilePreviewLatex()<CR>
    inoremap <C-p> <Esc>:call CompilePreviewLatex()<CR><Home>i
    vnoremap <C-p> <Esc>:call CompilePreviewLatex()<CR>
  endif
endfunction

" --------------------------------------------- "
"                    Markdown                   "
" --------------------------------------------- "

" We launch the following function on startup
autocmd VimEnter * call ManageVimMarkdownEnter()

function ConvertMarkdownToHTML()
  " We convert the markdown file to HTML
  :!pandoc -f markdown -t html5 --mathjax --template ~/.dotfiles/vim/markdown_template.html --metadata title="Markdown preview" -o %:r.html %
endfunction

function OpenMarkdownHTMLFile()
  " Open the HTML file corresponding to the current Markdown file
  execute '!open ' . expand('%:r') . '.html'
endfunction

function ManageVimMarkdownEnter()
  " If the file is a Markdown file,
  if &filetype == "markdown"
    " we convert it to HTML
    :call ConvertMarkdownToHTML()
    " and we bind the HTML preview command
    nnoremap <C-o> :call OpenMarkdownHTMLFile()<CR>
    inoremap <C-o> <Esc>:call OpenMarkdownHTMLFile()<CR>
    vnoremap <C-o> <Esc>:call OpenMarkdownHTMLFile()<CR>
    " and we bind the pandoc command
    nnoremap <C-p> :call ConvertMarkdownToHTML()<CR>
    inoremap <C-p> <Esc>:call ConvertMarkdownToHTML()<CR>
    vnoremap <C-p> <Esc>:call ConvertMarkdownToHTML()<CR>
  endif
endfunction

" --------------------------------------------- "
"         Python Plugin (python-mode)           "
" --------------------------------------------- "

" We set the version 3 of python if vim supports it
if has("python3")
  let g:pymode_python = 'python3'
endif
" We set the checkers
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pyflakes']
" We activate (and bind) the documentation script 
let g:pymode_doc = 1
let g:pymode_doc_bind = '<C-d>'
" We disable the folding
let g:pymode_folding = 0
