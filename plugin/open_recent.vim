vim9script noclear

# Recently opened files
# Maintainer:	Ubaldo Tiberi
# License: BSD3-Clause.

if !has('vim9script') ||  v:version < 900
    # Needs Vim version 9.0 and above
    echoerr "You need at least Vim 9.0"
    finish
endif

if exists('g:vim_open_recent_loaded')
    finish
endif
g:vim_open_recent_loaded = true

var change_dir = exists('g:vim_open_change_dir') ? g:vim_open_change_dir : false
var open_at_empty_startup = exists('g:vim_open_at_empty_startup') ? g:vim_open_at_empty_startup : true

def IsReadable(idx: number, val: string): bool
    return filereadable(expand(val))
enddef

def OpenRecent()
  var readables = filter(copy(v:oldfiles), IsReadable)
  popup_menu(readables, {
    title: " Recently opened files: ",
    line: &lines,
    col: &columns,
    posinvert: false,
    callback: (_, idx) => {
      if idx != -1
        execute($'edit {readables[idx - 1]}')
        if change_dir
          execute($"cd {expand('%:h')}")
        endif
      endif
      },
    filter: (id, key) => {
       # Handle shortcuts
       if key == '<\esc>'
        popup_close(id, -1)
       else
          return popup_filter_menu(id, key)
       endif
        return true
        },
    borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    border: [1, 1, 1, 1],
    maxheight: &lines / 2,
    })
enddef

command! OpenRecent OpenRecent()


if open_at_empty_startup
  def ShowRecentFiles()
    var readable_args = copy(v:argv[1 : ])->filter((_, x) =>
           !empty(x) && filereadable(x)
          )
    if len(readable_args) == 0
      execute('OpenRecent')
    endif
  enddef

  augroup OpenRecent
      autocmd!
      autocmd VimEnter * ShowRecentFiles()
  augroup END
endif
