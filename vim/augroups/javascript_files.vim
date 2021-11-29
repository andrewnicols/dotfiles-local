"===============================================================================
" Javascript specific stuff
"===============================================================================
augroup javascript_files
    function! StrTrim(txt)
      return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
    endfunction

    au FileType javascript call JavaScriptFold()
    au FileType javascript set shiftwidth=4
    au FileType javascript set tabstop=4
    au FileType javascript set softtabstop=4
    " F10 = Save And Shift
    au FileType javascript noremap <F10> :w:!shifter
    au FileType javascript noremap! <F10> :w:!shifter

    au FileType javascript let g:syntastic_javascript_checkers = ['eslint']
    au FileType javascript let g:syntastic_always_populate_loc_list = 1
    au FileType javascript let g:syntastic_auto_loc_list = 1
    au FileType javascript let g:syntastic_check_on_open = 1
    au FileType javascript let g:syntastic_check_on_wq = 1
    let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))

    au FileType javascript set foldtext=JSFoldText_DocBlock()

    function! JSFoldText_Function()
        return 'This is a function'
    endfunction

    function! JSFoldText_DocBlock()
        " Primary Tags.
        let niceTags = []
        let niceTags += ['module']
        let niceTags += ['main']
        let niceTags += ['class']
        let niceTags += ['method']
        let niceTags += ['event']
        let niceTags += ['property']
        let niceTags += ['attribute']

        " Build a List of the folded lines.
        let lines = getline(v:foldstart, v:foldend)
        let curline = 0
        let totallines = len(lines)
        while curline <= totallines
            let linevalue = substitute(lines[curline],
                  \ '.*@\(' . join(niceTags, '\|') . '\) \(.*\)$',
                  \ '\1 \2',
                  \ '')

            if linevalue != lines[curline]
              " The line has changed - report the value
              return printf('+-% 3d @%s', v:foldend-v:foldstart, linevalue)
            endif

            " Move to the next line
            let curline += 1
        endwhile

      return '+== ' . getline(v:foldstart)
    endfunction

augroup END
