" Place in:
" (Windows) ~/vimfiles/ftplugin/sql.vim  (Vim understands "~", "/", "$HOME" etc even on Windows. :echo $HOME to see value)
" (Unix/Mac) ~/.vim/ftplugin

" Only do this when not done yet for this buffer
if exists("b:did_sql_ftplugin")
   finish
endif
let b:did_sql_ftplugin = 1

setlocal textwidth=160
setlocal expandtab smarttab 
" Set language-specific tab size here:
" setlocal ts=3 sw=3 autoindent

" Display tabs according to colorscheme
let c_show_tabs = 1

" Class space errors (trailing spaces etc) as errors - highlight according to colorscheme
let c_space_errors = 0

iabbr echo dbms_output.put_line(
iabbr freom from
iabbr rae raise_application_error(-20000,
iabbr s* select * from
iabbr sc* select count(*) from
iabbr seelct select
iabbr selcet select
