# vim-open-recent

Open recent files from a popup menu.

<p align="center">
<img src="/vim_open_recent.png" width="100%" height="100%">
</p>

The plugin it is extremely light (less than 50 lines of code) and it has only
one command `:OpenRecent`.

If you want to change directory upon selection of a recently opened file, set
`g:vim_open_change_dir = true`.

> [!TIP]
>
> You may want at list of recently opened files displayed at Vim startup. If
> so, add the following lines in your `.vimrc`.
>
> ```
> def ShowRecentFiles()
>   var readable_args = filter(copy(v:argv[1 : ]), (_, x) =>
>          !empty(x) && filereadable(x)
>         )
>   if len(readable_args) == 0
>     execute('OpenRecent')
>   endif
> enddef
>
> augroup OpenRecent
>     autocmd!
>     autocmd VimEnter * ShowRecentFiles()
> augroup END
> ```

This plugin is written in Vim9.
