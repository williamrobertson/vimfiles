" Vim color file
" Maintainer:   William Robertson <willliam at williamrobertson dot net>
" Last Change:  March 2016
" URL:          https://github.com/williamrobertson/vimfiles
"
" Colour theme giving an element of dark drama while remaining uncluttered, calming and essentially cozy.
" Designed for desktop GUI screens - tested on Mac and Windows but not terminal.

set background=dark

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
   " Default tab display subtle so can be left on:
   hi	Tab	gui=NONE	guifg=NONE	guibg=#49545b

   " Display tab as error if required:
   if c_show_tabs > 1
      hi!	link	Tab	Error
   endif
endif

" SynColor Error		term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
hi!	link	Error	Tab

" Default GUI font colour and background:
hi	Normal	gui=NONE	guifg=#dab0a4	guibg=#2d3539
hi	Search	gui=Bold	guifg=NONE	guibg=#780000

hi	Comment	gui=Italic	guifg=#7f7f7f	guibg=NONE
hi	Exception	gui=Bold	guifg=#ef4641	guibg=NONE
hi	Function	gui=Bold	guifg=#bf6e78	guibg=NONE
hi!	link	Title	Function
hi	Identifier	gui=NONE	guifg=#cbb094	guibg=NONE
hi	Special	gui=NONE	guifg=#e03630	guibg=NONE
hi	Statement	gui=Bold	guifg=#da855c	guibg=NONE
" hi	Structure	gui=Bold	guifg=Black	guibg=NONE
hi	Type	gui=Bold	guifg=#d55820	guibg=NONE
hi	Constant	gui=NONE	guifg=#CD6A51	guibg=NONE
hi	Constant	gui=NONE	guifg=#907080	guibg=NONE

hi!	link	StorageClass	Type

" Lighter or darker background for text literals? - still deciding
"hi	String	gui=NONE	guifg=#ff7501	guibg=#40404a
hi	String	gui=NONE	guifg=#f09820	guibg=#323c48
hi!	Number	gui=NONE	guifg=#f09820	guibg=NONE

hi!	link	Float	Number
hi!	link	Boolean	Number

hi	Gutter	gui=NONE	guifg=Black	guibg=Grey
hi	LineNr	gui=NONE	guifg=#434F55	guibg=#22272A


hi	MatchParen	gui=NONE	guifg=Black	guibg=Orange
hi	More	gui=Bold	guifg=#208040	guibg=NONE
hi	NonText	gui=NONE	guifg=#434F55	guibg=#161A1C
hi	PreProc	gui=Bold	guifg=#9B869C	guibg=NONE
hi	Question	gui=NONE	guifg=#208040	guibg=NONE
hi	shShellVariables	gui=NONE	guifg=#304065	guibg=NONE
hi	SpecialKey	gui=NONE	guifg=#0000FF	guibg=NONE
hi	StatusLine	gui=Bold	guifg=Black	guibg=#EBE9ED
" TODO background is Type foreground
hi	Todo	gui=Bold	guifg=black	guibg=#d55820
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

