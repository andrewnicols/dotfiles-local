" Syntax highlighting on
syntax on

" We like indent.
filetype plugin indent on
filetype indent on

" Enable line numbering
set nu

" From Eloy
" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
