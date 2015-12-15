" Vim color file
" Maintainer:   William Robertson <willliam at williamrobertson dot net>
" Last Change:  14 February 2008
" URL:          http://www.williamrobertson.net/code/vimfiles (on my to-do list...)
"
" Color theme aiming for uncluttered, calming look using a restricted pallette mostly in the silver/blue/purple range.
" Designed for desktop GUI screens - tested on Mac and Windows but not terminal.
" Originally based on "Kate" 1.1 by Donald Ephraim Curtis <dcurtis@gmail.com> http://www.vim.org/scripts/script.php?script_id=1758
" Also note Vim defaults in syncolor.vim. :syn lists all syntax groups currently defined.

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

" Display tabs according to setting of c_show_tabs (set in vimrc using "let c_show_tabs = n")
" 0 or unset: no display
" 1: highlight
" 2: highlight as error
" Various alternatives at http://vim.wikia.com/wiki/Highlight_unwanted_spaces
if exists("c_show_tabs") && c_show_tabs > 0
   " Default tab display as pale silver so can be left on:
   hi	Tab	gui=NONE	guifg=NONE	guibg=#f9f7f8

   " Display tab as error if required:
   if c_show_tabs > 1
      hi!	link	Tab	Error
   endif
endif

" Default Error highlighting from syncolor.vim is white on red - tone down a bit as most of the time you can't do anything about it:
" SynColor Error		term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
hi!	link	Error	Tab

" Default GUI font forground colour:
hi	Normal	gui=NONE	guifg=#bfbfbf	guibg=#384146
hi	Normal	gui=NONE	guifg=#D8b8A4	guibg=#2d3539

"hi	Search	gui=NONE	guifg=#d0a000	guibg=#780000
hi	Search	gui=NONE	guifg=NONE	guibg=#780000

hi	Comment	gui=italic	guifg=#7f7f7f	guibg=NONE
hi	Exception	gui=bold	guifg=#ef4641	guibg=NONE
hi	Function	gui=bold	guifg=#af6e7b	guibg=NONE
hi!	link	Title	Function
hi	Identifier	gui=NONE	guifg=#cbb094	guibg=NONE
hi	Special	gui=NONE	guifg=#e03630	guibg=NONE
hi	Statement	gui=bold	guifg=#da855c	guibg=NONE
" hi	Structure	gui=bold	guifg=Black	guibg=NONE
hi	Type	gui=BOLD	guifg=#d55820	guibg=NONE
hi	Constant	gui=NONE	guifg=#1a8dd5	guibg=NONE

hi!	link	StorageClass	Type

hi	String	gui=NONE	guifg=#ff7501	guibg=#443b36
hi	String	gui=NONE	guifg=#ff7501	guibg=#22272A

"hi!	Number	gui=NONE	guifg=#ff8019	guibg=NONE
hi!	Number	gui=NONE	guifg=#ff7501	guibg=NONE
hi!	link	Float	Number
hi!	link	Boolean	Number

hi	Gutter	gui=NONE	guifg=Black	guibg=Grey
hi	LineNr	gui=NONE	guifg=#434F55	guibg=#22272A
hi	MatchParen	gui=NONE	guifg=Black	guibg=Yellow
hi	More	gui=bold	guifg=#208040	guibg=NONE
hi	NonText	gui=NONE	guifg=#434F55	guibg=#161A1C
hi	PreProc	gui=bold	guifg=#708090	guibg=NONE
hi	Question	gui=NONE	guifg=#208040	guibg=NONE
hi	shShellVariables	gui=NONE	guifg=#304065	guibg=NONE
hi	SpecialKey	gui=NONE	guifg=#0000FF	guibg=NONE
hi	StatusLine	gui=bold	guifg=Black	guibg=#EBE9ED
hi	Todo	gui=bold	guifg=Black	guibg=#FFCCCC
hi	Visual	gui=reverse	guifg=NONE	guibg=NONE

" C/C++ Colors
hi	link	cIncluded	PreProc
hi	link	cSpecial	Special
hi	link	cSpecialCharacter	cSpecial

" HTML overrides
hi	link	HtmlTag	HtmlTagName
hi	link	HtmlEndTag	HtmlTagName

" Vim colors (override $VIMRUNTIME/colors/[Mac]Vim.vim):
hi	link	netrwDir	Title
hi!	Underlined	gui=underline	guifg=#708090


" Enormous tab size for viewing values in columns
" vim: ts=20
