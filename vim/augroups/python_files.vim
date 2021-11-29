"===============================================================================
" Python specific stuff
"===============================================================================
augroup python_files

    au FileType python let python_folding = 1
    au FileType python set shiftwidth=4
    au FileType python set tabstop=4
    au FileType python set softtabstop=4
    au FileType python match Error /\s\+$/
    au FileType python set formatoptions-=w

augroup END
