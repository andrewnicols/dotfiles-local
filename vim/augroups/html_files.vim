"===============================================================================
" HTML-like markup stuff
"===============================================================================
augroup html_files

    au FileType html,xml,tpl map <F3> I<td>A</td>   " put <td>s around a line
    au FileType html,xml,tpl map <F7> A<br>j

augroup END
