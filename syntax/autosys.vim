" Vim syntax file
" Language: Autosys: Autosys job definition
" Last change: 28/06/2006

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:_syntax")
  finish
endif

syn keyword autosysJobType job_type Job_Type
syn match autosysLabel "^[\ \t]*[@a-z_$][a-z0-9_$@]*\ *:"
syn match shellvarbracketted "\$\{1,2\}{[^}]\{1,\}}"
syn region autosysString start=/"/ end=/"/
syn region autosysCondSuccess start="s(" end=")"
syn region autosysCondFailure start="f(" end=")"
syn region autosysCondDone start="d(" end=")"
syn region autosysCondDone start="t(" end=")"
syn region autosysCondVariable start="v(" end=")"
syn region autosysComment start="\/\*" end="\*\/"


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_autosys_syntax_inits")
  if version < 508
    let did_autosys_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink autosysLabel		Keyword
  HiLink shellvarbracketted		Include
  HiLink autosysJobType		Include
  HiLink autosysString		Type
  HiLink autosysComment		Comment
  HiLink autosysCondSuccess	String
  HiLink autosysCondFailure	String
  HiLink autosysCondDone	String
  HiLink autosysCondVariable	String


  delcommand HiLink
endif

let b:current_syntax = "autosys"


