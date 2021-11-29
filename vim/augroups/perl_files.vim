"===============================================================================
" Perl specific stuff
"===============================================================================
augroup perl_files

    au BufRead *.cgi set filetype=perl

    au FileType perl let perl_extended_vars = 1
    au FileType perl let perl_fold = 1
    au FileType perl ab subr #######################################ka Parameters: 2ka sub

augroup END
