" ------------------------------------------------------------------------
" Autocommands
" ------------------------------------------------------------------------

" Universal priority autocommands
" This augroup is first, therefore, anything in it runs first.  Only priority
" commands should go in this group.
augroup universal-priority
    "autocmd!

    " Set up project paths for things like :find and ins-completion using
    " whole-tree glob expansion.
    "
    " This is done in two different ways.  The first one is the correct way,
    " the second is a hack around ftplugins which replace the path setting
    " wholesale on the assumption that they know best.  (I have nothing
    " against type-specific paths, but the local project should really have
    " priority.)
    if v:version >= 700
        autocmd BufNewFile,BufReadPre * call <sid>path_from_tagfiles()
        autocmd FileType *              call <sid>path_from_tagfiles()
        autocmd BufWritePost,FileWritePost,FileAppendPost *
                                    \   call Rebuild_Tagfiles()
    endif
augroup END
