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
hi	Normal	gui=NONE	guifg=Black	guibg=NONE

hi	Comment	gui=italic	guifg=#758595	guibg=NONE
hi	Exception	gui=bold	guifg=#a83060	guibg=NONE
" hi	Function	gui=bold	guifg=#007882	guibg=NONE
hi	Function	gui=bold	guifg=DarkCyan	guibg=NONE
hi	Identifier	gui=NONE	guifg=#051020	guibg=NONE
hi	Special	gui=NONE	guifg=#7056a8	guibg=NONE
hi	Statement	gui=bold	guifg=#051020	guibg=NONE
hi	Structure	gui=bold	guifg=Black	guibg=NONE
hi	Title	gui=BOLD	guifg=DarkMagenta	guibg=NONE
hi	Type	gui=BOLD	guifg=#084094	guibg=NONE
hi	Constant	gui=NONE	guifg=#084094	guibg=NONE

hi!	link	StorageClass	Type

hi	String	gui=NONE	guifg=#1070F0	guibg=NONE
hi	String	gui=NONE	guifg=#0080E0	guibg=NONE

hi!	Number	gui=NONE	guifg=#00b072	guibg=NONE
hi!	link	Float	Number
hi!	link	Boolean	Number

hi	Gutter	gui=NONE	guifg=Black	guibg=Grey
hi	LineNr	gui=NONE	guifg=white	guibg=#C0C8D0
hi	MatchParen	gui=NONE	guifg=Black	guibg=Yellow
hi	More	gui=bold	guifg=#208040	guibg=NONE
hi	NonText	gui=bold	guifg=white	guibg=#C0C8D0
hi	PreProc	gui=bold	guifg=#708090	guibg=NONE
hi	Question	gui=NONE	guifg=#208040	guibg=NONE
hi	shShellVariables	gui=NONE	guifg=#304065	guibg=NONE
hi	SpecialKey	gui=NONE	guifg=#0000FF	guibg=NONE
hi	StatusLine	gui=bold	guifg=Black	guibg=#EBE9ED
hi	Todo	gui=bold	guifg=black	guibg=#FFCCCC
hi	Visual	gui=reverse	guifg=NONE	guibg=NONE

" C/C++ Colors
hi	link	cIncluded	PreProc
hi	cOctal	gui=NONE	guifg=#008080	guibg=NONE
hi	cSpecial	gui=NONE	guifg=#FF00FF	guibg=NONE
hi	link	cSpecialCharacter	cSpecial

" Latex Colors (inherited from original Kate colorscheme)
"hi texStatement guifg=#606000
hi	link	texType	Normal
hi	link	texDocType	Type
hi	link	texDefParm	Normal
hi	link	texInput	Normal
hi	link	texInputFile	Normal
hi	link	texNewCmd	texDocType
hi	link	texSection	String
hi	link	texSectionName	SpecialKey
hi	link	texDelimiter	Normal
hi	link	texRefZone	Normal
hi	link	texMath	PreProc
hi	link	texLigature	texMath
hi	texStatement	gui=NONE	guifg=#800000	guibg=NONE

" Enormous tab size for viewing values in columns
" vim: ts=20
