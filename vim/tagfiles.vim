if v:version >= 700
    function! s:path_from_tagfiles()
        let l:path = join(
            \           map(tagfiles(),
            \               'fnamemodify(v:val, ":p:h") . "/**"'),
            \           ',')

        if stridx(&l:path, l:path) == -1
            let &l:path = l:path . ',' . &l:path
        endif
    endfunction

    function! Rebuild_Tagfiles()
        for l:tagfile in tagfiles()
            " Calling isdirectory() may look a bit silly here, but tagfiles()
            " does return directories in some versions of Vim.
            if filewritable(l:tagfile) && ! isdirectory(l:tagfile)
                let l:tagfile = fnamemodify(l:tagfile, ':p')
                for l:cmd in g:Rebuild_Tagfiles_Commands
                    if match(l:tagfile, l:cmd[0]) != -1
                        let l:syscmd = substitute(l:cmd[1], '{file}',
                                                    \ l:tagfile, 'g')
                        let l:output = system(l:syscmd)
                        if v:shell_error != 0
                            echoerr "Command '" . l:syscmd . "' exited "
                                        \ . v:shell_error . ': ' . l:output
                        endif

                        break
                    endif
                endfor
            endif
        endfor
    endfunction
    if ! exists('g:Rebuild_Tagfiles_Commands')
        let g:Rebuild_Tagfiles_Commands =
            \ [
                \ [ '^use this if your ctags takes too long and/or you need an atomic ctags file installation', '(cd `dirname "{file}"` && ctags -R -o "{file}.tmp" ; mv "{file}.tmp" "{file}") &' ],
                \ [ '', 'cd `dirname "{file}"` && ctags -R -o "{file}"' ]
            \ ]
    endif
endif
