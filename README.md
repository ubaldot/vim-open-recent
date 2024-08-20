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
> It may handy to have the following lines in your `.vimrc`. In that way, if
> you launch Vim with no file as argument, you get automatically displayed a
> list of recently opened files.
>
> ```
> def OpenRecentNicer()
>     if len(v:argv) > 1
>       # Iterate through the command-line arguments
>       for arg in v:argv[1 : ]
>           # Check if the argument is not an option (doesn't start with '-')
>           if arg[0] !=# '-'
>               # Check if the argument is a valid file. If so, don't open recent
>               # files.
>               if filereadable(arg)
>                   return
>               endif
>           endif
>       endfor
>     endif
>
>     execute('OpenRecent')
> enddef
>
> augroup OpenRecent
>     autocmd!
>     autocmd VimEnter * OpenRecentNicer()
> augroup END
> ```

Written in Vim9.
