if exists('b:jlang_vim_ftplugin')
	finish
endif
let b:jlang_vim_ftplugin = 1

set smarttab
au BufNewFile,BufRead *.ijs setl shiftwidth=2
setlocal commentstring=NB.\ %s

function! SetupMaps() abort
  if !exists("g:JconsoleLeader")
    let g:JconsoleLeader = '..'
  endif

  if !exists("g:JconsoleSelection")
    let g:JconsoleSelection = ','
  endif

  if !exists("g:JconsoleAll")
    let g:JconsoleAll = '.'
  endif

  if !exists("g:JconsoleRepl")
    let g:JconsoleRepl = 'r'
  endif

  if !exists("g:JconsoleBin")
    if executable('ijconsole')
      let g:JconsoleBin = 'ijconsole'
    else
      echohl ErrorMsg
      echoerr "Can't find 'ijconsole'. You need to either symlink it to your jconsole binary or specify the location of 'jconsole' with 'g:JconsoleBin'. Bye!"
      echohl None
      return
    endif
  endif

  if executable('uname')
    let s:osname = systemlist('uname')[0]
    if (s:osname =~ 'Darwin\|Linux\|OpenBSD')
      let g:mapleader = g:JconsoleLeader
      exec "xnoremap <leader>" . g:JconsoleSelection . " <Esc>:'<,'>:w !" . g:JconsoleBin . "<CR>"
      exec "nnoremap <leader>" . g:JconsoleAll . " <Esc>:%:w !" . g:JconsoleBin . "<CR>"
      exec "nnoremap <leader>" . g:JconsoleRepl . " <Esc>:!" . g:JconsoleBin . " %<CR>"
    endif
  endif
  return
endfunction
call SetupMaps()

function! StripTrailingWhitespace()
    let myline=line('.')
    let mycolumn = col('.')
    exec 'silent %s/  *$//'
    call cursor(myline, mycolumn)
endfunction

if exists('g:jlang_strip_whitespace')
    if g:j_strip_whitespace == 1
        au BufWritePre *.ijs silent! call StripTrailingWhitespace()
    endif
endif
