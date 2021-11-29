"===============================================================================
" PHP specific stuff
"===============================================================================
augroup php_files

    au FileType php let php_folding = 1
    " Don't screw up folds when inserting text that might affect them,
    " until leaving insert mode. Foldmethod is local to the window.
    au FileType php autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
    au FileType php autocmd InsertLeave * let &l:foldmethod=w:last_fdm
    au FileType php ab subr #######################################ka Parameters: 2ka function
    au FileType php set shiftwidth=4
    au FileType php set tabstop=4
    au FileType php set softtabstop=4
    au FileType php match Error /\s\+$/
    au FileType php set formatoptions-=w

    " Moodle specific
    au BufRead /home/nicols/git/software/moodle/* :so /home/nicols/git/software/useful/docs/master.vim
    au FileType php let g:syntastic_php_phpcs_args='--standard=/Users/nicols/integration/tools/moodle-local_codechecker/moodle/ruleset.xml'
    let g:syntastic_php_checkers = ['php']

augroup END

let g:syntastic_php_phpmd_post_args="~/.phpmd/unused.xml"
