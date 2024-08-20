# vim-open-recent

Open recent files from a popup menu.

<p align="center">
<img src="/vim_open_recent.png" width="100%" height="100%">
</p>

The plugin it is extremely light (less than 50 lines of code) and it has only
one command `:OpenRecent`.

If you want to change directory upon selection of a recently opened file, set
`g:vim_open_change_dir = true`.

> [TIP!] It may handy to have the following in your `.vimrc` file:
>
> ```
> augroup OpenRecent
>    autocmd!
>    autocmd VimEnter * :OpenRecent
> augroup END
> ```

Written in Vim9.
