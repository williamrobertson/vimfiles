" Vim syntax file
" Language:     SQL, PL/SQL (Oracle 12c)
" Maintainer:   William Robertson (william at williamrobertson dot net)
" Last Change:  October 2015
" Replaced all keywords from Oracle 12c docs etc, merged with plsql.vim.

" Skip if already applied:
if exists("b:current_syntax")
  finish
endif

" All keywords etc are case-insensitive:
syn case ignore

" Identifiers (functions, keywords etc will override later on):
" (Quick way to ensure some edge cases e.g. SOMETABLE#2 are treated as one word and not word + number)
" \h = head of word character [A-Za-z_]
syn match	sqlIdentifier	"\<\h[a-z0-9_#$]*\>"

" Variables (&substitution; :host/bind):
syn match	sqlVariable	"\v\&{1,2}[a-z0-9_#$]+\.?"
syn match	sqlVariable	/\v<:[a-z][a-z0-9_#$]*/

syn match	sqlOperator	"[*<>=]"
syn match	sqlOperator	"||"
syn match	sqlOperator	"\*"
syn match	sqlOperator	"[!^:]="
syn keyword	sqlOperator	connect_by_root empty escape exists intersect minus present prior
syn match	sqlOperator	"\v<union(\s+all)?>"
syn match	sqlOperator	"\v<multiset\s+(except|intersect)>"
syn match	sqlOperator	"\<a\s\+set\>"

" Top-level statements
syn keyword	sqlStatement	add administer alter audit comment commit delete drop grant insert lock merge noaudit
syn keyword	sqlStatement	rename revoke rollback savepoint select set truncate synonym update
syn match	sqlStatement	/\<explain\s\+plan\>/
syn match	sqlStatement	/\v<create(\s+or\s+replace)?>/
syn match	sqlStatement	/\<set\s\+transaction\>/

" Types (include full definition e.g. INTERVAL DAY(3) TO SECOND(3) so displays as one colour)
" syn keyword	sqlType	bfile binary_double binary_float blob clob date dec decimal dsinterval_unconstrained float identity integer
syn keyword	sqlType	blob clob date dec decimal dsinterval_unconstrained float identity integer long
syn keyword	sqlType	nchar nclob nvarchar2 numeric raw real refcursor smallint varray xmltype
syn match	sqlType	"\v<interval\s+(day|hour)\s*(\([0-9]+\))?\s+to\s+(minute|second)>\s*(\([0-9]+\))?"
syn match	sqlType	"\v<binary_(double|float|integer)"
syn match	sqlType	"\v<interval\s+year\s*(\([0-9]+\))?\s+to\s+month>\s*(\([0-9]+\))?"
syn match	sqlType	"\<double\s\+precision\>"
syn match	sqlType	"\v<number>\s*(\(\s*[0-9]+\s*(,\s*[0-9]+)?\))?"
syn match	sqlType	"\v<timestamp\s*((\s*[0-9]+\s*))?(\s+with(\s+local)?\s+time\s+zone>)?"
syn match	sqlType	"\v<timestamp\s+with(\s+local)?\s+time\s+zone>"
syn match	sqlType	"\v<varchar2?>\s*(\(\s*[0-9]+\s*(byte|char)?\s*\))?"

" SQL keywords:
syn keyword	sqlKeyword	add aggregate all and any apply as[c] authid authorization between body by cascade case check checkpoint cluster collate column compress
syn keyword	sqlKeyword	compute connect constraint constructor context cross current database deallocate default definer
syn keyword	sqlKeyword	deleting deny desc deterministic dimension disk distinct distributed dummy editionable else elsif end errlvl escape exceptions
syn keyword	sqlKeyword	execute exists xxexternal file final follows for from full function group hash hashkeys having heap identified in index initrans inner inserting instantiable intersect
syn keyword	sqlKeyword	into is java join left limit list load local location logging map match matched maxtrans measures member model nocompress nocopy nocycle nologging noneditionable noparallel not
syn keyword	sqlKeyword	nowait null object of on opaque open operator or order xxorganization out outer over overriding package parallel parallel_enable partition pipe pipelined pivot plan policy precedes
syn keyword	sqlKeyword	print procedure public range records reject references restrict result result_cache return returning right row[s] save schema self sequence sequential session session_user
syn keyword	sqlKeyword	setuser shutdown some start static storage subpartition synonym table tablespace terminated then to[p] trigger type unbounded under union unique unlimited unpivot
syn keyword	sqlKeyword	updating upsert use using values view when where with within write

syn match	sqlKeyword	"\<a\s\+set\>"
" syn match	sqlKeyword	"\<access\s\+parameters\>"
syn match	sqlKeyword	"\<fields\s\+terminated\>"
syn match	sqlKeyword	"\v<like[24c]?>"
syn match	sqlKeyword	"\v<nulls (fir|la)st>"
syn match	sqlKeyword	"\v<pct(free|used)>"
syn match	sqlKeyword	"\<isolation\s\+level\>"
syn match	sqlKeyword	"\<contains\>"
syn match	sqlKeyword	"\v^\s*col(u(mn?)?)?>"
syn match	sqlKeyword	"\v^\s*def(ine)?>"
syn match	sqlKeyword	"\v^\s*exec(u(te?)?)?>"
syn match	sqlKeyword	"\v^\s*get>"
syn match	sqlKeyword	"\v^\s*ho(st)?>"
syn match	sqlKeyword	"\v^\s*sto(re?)?>"
syn match	sqlKeyword	"\v^\s*timi(ng?)?>"
syn match	sqlKeyword	"\v^\s*ttitle>"
syn match	sqlKeyword	"\v^\s*undef(ine)?>"
syn match	sqlKeyword	"\v^\s*var(i(a(b(le?)?)?)?)?>"
syn match	sqlKeyword	"\v<(primary|foreign)\s+key>"
syn match	sqlKeyword	"[;.,()@\-+]"

" PL/SQL-specific keywords
syn keyword	plsqlKeyword	authid authorization begin break close constructor continue current declare deleting
syn keyword	plsqlKeyword	exception exit fetch forall goto if inserting loop map match matched nocopy opaque open pipelined raise
syn keyword	plsqlKeyword	raise_application_error read record result result_cache returning row rows save self sqlcode sqlerrm static subtype sys_refcursor updating while 
syn keyword	plsqlKeyword	%isopen %found %notfound %rowcount
syn match	plsqlKeyword	"\<bulk\s\?collect\>"
syn match	plsqlKeyword	"\<execute\s\?immediate\>"
syn match	plsqlKeyword	"\<pipe\s\?row\>"
syn match	plsqlkeyword	"%\(BULK_EXCEPTIONS\|BULK_ROWCOUNT\|ISOPEN\|FOUND\|NOTFOUND\|ROWCOUNT\)\>"

syn match	plsqlKeyword	"\.count\>"
syn match	plsqlKeyword	"\.delete\>"
syn match	plsqlKeyword	"\.exists\>"
syn match	plsqlKeyword	"\.extend\>"
syn match	plsqlKeyword	"\.first\>"
syn match	plsqlKeyword	"\.last\>"
syn match	plsqlKeyword	"\.limit\>"
syn match	plsqlKeyword	"\.next\>"
syn match	plsqlKeyword	"\.prior\>"
syn match	plsqlKeyword	"\.trim\>"

" Trigger-related keywords
syn keyword	plsqlTrigger	inserting updating deleting follows precedes
syn match	plsqlTrigger	"\<\(before\|after\|instead\s\+of\)\s\+\(insert\|update\|delete\|drop\)\>"
syn match	plsqlTrigger	"each\s\+row\>"

" Predefined PL/SQL exceptions
syn keyword	plsqlException	access_into_null case_not_found collection_is_null cursor_already_open dup_val_on_index invalid_cursor invalid_number
syn keyword	plsqlException	login_denied no_data_found no_data_needed not_logged_on others program_error rowtype_mismatch self_is_null storage_error
syn keyword	plsqlException	subscript_beyond_count subscript_outside_limit sys_invalid_rowid timeout_on_resource too_many_rows value_error zero_divide

" Other PL/SQL:
syn keyword	plsqlBooleanLiteral	TRUE FALSE
syn match	plsqlLabel	"<<\s*\h\S\+\s*>>"

" PL/SQL-specific types:
syn keyword	plsqlType	anydata anytype binary_integer boolean constant cursor dsinterval_unconstrained lob mlslabel naturaln nchar_cs pls_integer positive positiven precision
syn keyword	plsqlType	real signtype simple_integer string sys_refcursor timestamp_unconstrained timestamp_tz_unconstrained timestamp_ltz_unconstrained urowid year yminterval_unconstrained
syn match	plsqlType	"\<ref\s\+cursor\>"
syn match	plsqlType	"\<[a-z][a-z0-9_#$]*%\(row\)\?type\>"
syn match	plsqlType	"\<[a-z][a-z0-9_#$]*\.[a-z][a-z0-9_#$]*%\(row\)\?type\>"

syn keyword	plsqlPragma	pragma autonomous_transaction exception_init inline restrict_references serially_reusable udf
syn match	plsqlPreproc	"$$PLSCOPE_SETTINGS\>"
syn match	plsqlPreproc	"$$NLS_LENGTH_SEMANTICS\>"
syn match	plsqlPreproc	"$\(IF\|ELSIF\|ELSE\|ERROR\|THEN\|END\)\>"
syn match	plsqlPreproc	"\$\$PLSQL_\(LINE\|UNIT\|CCFLAGS\|CODE_TYPE\|OPTIMIZE_LEVEL\|WARNINGS\)"
syn match	plsqlPreproc	"\$\$"
syn match	plsqlPreproc	"\$\$\h[a-z0-9_#$]*"

" Functions from Oracle 12.1 SQL reference
syn keyword	sqlFunction	abs acos add_months appendchildxml approx_count_distinct ascii ascistr asin atan[2] avg bfilename bin_to_num bitand cardinality cast ceil
syn keyword	sqlFunction	chartorowid child chr  coalesce collect compose con_dbid_to_id
syn keyword	sqlFunction	con_guid_to_id con_name_to_id con_uid_to_id concat convert corr cos cosh count covar_pop covar_samp cume_dist current_date current_user
syn keyword	sqlFunction	dbtimezone decode decompose deletexml dense_rank depth dump empty_blob empty_clob existsnode exp extract extractvalue feature_details feature_id
syn keyword	sqlFunction	feature_set feature_value first first_value floor following from_tz greatest group_id grouping grouping_id hextoraw hierarchy initcap
syn keyword	sqlFunction	insertchildxml insertchildxmlafter insertchildxmlbefore insertxmlafter insertxmlbefore
" syn keyword	sqlFunction	json_query json_table json_value
syn keyword	sqlFunction	keep lag last last_day last_value lead
syn keyword	sqlFunction	least listagg ln lnnvl localtimestamp log lower lpad ltrim max median min mod months_between nanvl nchr new_time next_day
" syn keyword	sqlFunction	nls_charset_decl_len nls_charset_id nls_charset_name nls_initcap nls_lower nls_upper
syn keyword	sqlFunction	nlssort nth_value ntile nullif
" syn keyword	sqlFunction	ora_dst_affected ora_dst_convert ora_dst_error ora_hash ora_invoking_user ora_invoking_userid
syn keyword	sqlFunction	path percent_rank percentile_cont percentile_disc
syn keyword	sqlFunction	power powermultiset[_by_cardinality] preceding
" syn keyword	sqlFunction	prediction prediction_bounds prediction_cost prediction_details prediction_probability prediction_set
syn keyword	sqlFunction	rank ratio_to_report rawtohex rawtonhex
" syn keyword	sqlFunction	regexp_count regexp_instr regexp_replace regexp_substr
" syn keyword	sqlFunction	regr_avgx regr_avgy regr_count regr_intercept regr_r2 regr_slope regr_sxy regr_syy
syn keyword	sqlFunction	remainder replace reverse round row_number rowidtochar rowidtonchar rpad rtrim rules
syn keyword	sqlFunction	scn_to_timestamp sessiontimezone sign sin sinh soundex sqrt standard_hash stats_binomial_test stats_crosstab
syn keyword	sqlFunction	stats_f_test stats_ks_test stats_mode stats_mw_test stats_one_way_anova stats_wsr_test stddev stddev_pop stddev_samp sum sys_connect_by_path
"syn keyword	sqlFunction	sys_context sys_dburigen sys_extract_utc sys_guid sys_op_zone_id sys_typeid sys_xmlagg sys_xmlgen
syn keyword	sqlFunction	tan tanh timestamp_to_scn
" syn keyword	sqlFunction	to_binary_double to_binary_float to_blob to_char to_clob to_date to_dsinterval to_lob to_multi_byte to_nchar to_nclob to_number to_single_byte
" syn keyword	sqlFunction	to_timestamp to_timestamp_tz to_yminterval
syn keyword	sqlFunction	translate treat trim trunc tz_offset uid unistr updatexml xupper user userenv var_pop var_samp variance vsize width_bucket
" syn keyword	sqlFunction	xmlagg xmlcast xmlcdata xmlcolattval xmlcomment xmlconcat xmldiff xmlelement xmlexists xmlforest xmlisvalid xmlparse xmlpatch xmlpi
" syn keyword	sqlFunction	xmlquery xmlroot xmlsequence xmlserialize xmltable xmltransform

syn match	sqlFunction	"\v<nvl2?>"
syn match	sqlFunction	"\v<count\(\*\)"
syn match	sqlFunction	"\v<cluster_(details|distance|id|probability|set)>"
syn match	sqlFunction	"\v<json_(query|table|value)>"
syn match	sqlFunction	"\v<length[24bc]?>"
syn match	sqlFunction	"\v<nls_(charset_decl_len|charset_id|charset_name|initcap|lower|upper)>"
syn match	sqlFunction	"\v<numto(ds|ym)interval>"
syn match	sqlFunction	"\v<ora_(dst_affected|dst_convert|dst_error|hash|invoking_user|invoking_userid)>"
syn match	sqlFunction	"\v<prediction(_bounds|_cost|_details|_probability|_set)?>"
syn match	sqlFunction	"\v<regexp_(count|instr|replace|substr)>"
syn match	sqlFunction	"\v<regr_(avgx|avgy|count|intercept|r2|slope|sxy|syy)>"
syn match	sqlFunction	"\v<sys_(context|dburigen|extract_utc|guid|op_zone_id|typeid|xml(agg|gen))>"
syn match	sqlFunction	"\v<to_(binary_double|binary_float|blob|char|clob|date|dsinterval|lob|multi_byte|nchar|nclob|number|single_byte|timestamp|timestamp_tz|yminterval)>"
syn match	sqlFunction	"\v<xml(agg|cast|cdata|colattval|comment|concat|diff|element|exists|forest|isvalid|parse|patch|pi|query|root|sequence|serialize|table|transform)>"
syn match	sqlFunction	"\v<(in|sub)str[24bc]?>"

" Pseudocolumns
syn keyword	sqlPseudo	column_value current_timestamp level object_id ora_rowscn rowid rownum sysdate systimestamp versions_xid
syn match	sqlPseudo	"\v<versions_(start|end)(scn|time)>"
syn match	sqlPseudo	"\v<connect_by_is(leaf|cycle)>"
syn match	sqlpseudo	"\.currval\>"
syn match	sqlpseudo	"\.nextval\>"

" Character literals and quoted identifiers
" (offset can be used here to exclude quote characters from highlighting: hs/he=highlighting start/end, e.g. start=+'+hs=s+1 end=+'+he=e-1)
" TODO: not sure whether or not it's a good idea to have sqlString contain sqlVariable, e.g. to_char(sysdate,'HH24:MI:SS') highlights :MI and :SS as binds.
syn region	sqlQuotedId	start=+"+ end=+"+
syn region	sqlString	start=+'+ end=+'+ contains=sqlVariable
syn region	sqlString	start=+n'+ end=+'+ contains=sqlVariable
" Q-quotes (most likely variants):
"    https://docs.oracle.com/database/121/SQLRF/sql_elements003.htm#SQLRF00220:
"    quote_delimiter is any single- or multibyte character except space, tab, and return.
syn region	sqlString	start=+n\?q'\[+  end=+\]'+ contains=sqlVariable
syn region	sqlString	start=+n\?q'<+  end=+>'+ contains=sqlVariable
syn region	sqlString	start=+n\?q'{+  end=+}'+ contains=sqlVariable
syn region	sqlString	start=+n\?q'(+  end=+)'+ contains=sqlVariable
" Can use \z(pattern\) backreference when same symbol is used for start and and e.g. q'! ... !'
syn region	sqlString	start="n\?q'\z([\*!?$%^":~]\)"  end="\z1'" contains=sqlVariable

" SQL*Plus prompts
syn region	sqlString	matchgroup=sqlKeyword start=+\v^\s*pro(mpt)?>+ end=+$+ contains=sqlVariable oneline

" Numbers - allows trailing d or f (double/float), and exponents e.g. 1e6
" WR 2015
syn match	sqlNumber	"\v[-+][0-9]*\.?[0-9]+(e[-+]?[0-9]+|[df])?>"
syn match	sqlNumber	"\v<[0-9]*\.?[0-9]+(e[-+]?[0-9]+|[df])?>"

" Comments - note '\' is not an escape character in SQL
syn region	sqlComment	start="/\*"  end="\*/" contains=Todo
syn match	sqlComment	"--.*$" contains=Todo
" Old style SQL*Plus comment:
syn match	sqlComment	/\v^\s*rem(a(rk?)?)?>.*$/
syn sync ccomment sqlComment

" Make these TODO so they stand out as needing review:
" (Could include LONG as superceded by LOB, but PL/SQL's unrelated LONG type is fine)
syn keyword	sqlTodo	natural analyze
syn match	sqlTodo	/\v<char>\s*(\(.*\))?/
syn match	sqlTodo	/\v<varchar>\s*(\(.*\))?/
syn match	sqlTodo	/\v<nvarchar>\s*(\(.*\))?/

" Standard Todo.
syn keyword	Todo	TODO FIXME DEBUG NOTE

" Special rules for external tables (CHAR is standard not TODO, various other keywords only valid here)
" (Experimental. Doesn't work.)
syn match	sqlXTType	contained /\v<char>\s*(\(\s*[0-9]*\s*\))?/
syn match	sqlXTType	contained /\v<raw>\s*(\(\s*[0-9]*\s*\))?/
syn match	sqlXTType	contained /\v<integer(\s*external)?>\s*(\(\s*[0-9]*\s*\))?/
syn match	sqlXTType	contained /\v<unsigned\s+integer(\s*external)?>\s*(\(\s*[0-9]*\s*\))?/
syn match	sqlXTType	contained "\v<var(char|raw)c?>\s*(\(\s*[0-9]+\s*(,\s*[0-9]+)?\))?"
syn keyword	sqlXTType	contained big endian binary_float binary_double counted csv date_format date decimal double embedded float int integer little mask oracle_date oracle_loader oracle_number unsigned zoned
syn keyword	sqlXTKeyword	contained access are blanks data delimited directory dnfs_enable dnfs_readbuffers enclosed end field[s] length lrtrim ldrtrim location missing newline notrim nullif optionally override reject parameters position start terminated whitespace
syn region	sqlXTParams	transparent matchgroup=sqlKeyword start=+\<organization\s\+external\>+ end=+)+ contains=sqlXTTYPE,sqlXTKeyword,Todo

" Whitespace (display depends on c_show_tabs and c_space_errors set in vimrc, and colour scheme for actual highlighting):
syn match	sqlTrailingSpace	" \+$"
syn match	sqlTab	"\t"

" Catch mis-matched parentheses:
syn cluster	plsqlParenGroup	contains=plsqlParenError,@plsqlCommentGroup
if exists("c_no_bracket_error")
   syn region plsqlParen transparent start='(' end=')' contains=ALLBUT,@plsqlParenGroup
   syn match plsqlParenError ")"
   syn match plsqlErrInParen contained "[{}]"
else
   syn region plsqlParen transparent start='(' end=')' contains=ALLBUT,@plsqlParenGroup,plsqlErrInBracket
   syn match plsqlParenError "[\])]"
   syn match plsqlErrInParen contained "[{}]"
   syn region plsqlBracket transparent start='\[' end=']' contains=ALLBUT,@plsqlParenGroup,plsqlErrInParen
   syn match plsqlErrInBracket contained "[);{}]"
endif

" Syntax Synchronizing
syn sync minlines=10 maxlines=100

command -nargs=+ HiLink hi def link <args>

" Assign plain tab first, in case reclassified as an error later according to c_space_errors:
HiLink sqlTab	Tab

HiLink plsqlKeyword	sqlKeyword
HiLink sqlKeyword	sqlStatement
HiLink sqlOperator	sqlStatement
HiLink sqlPseudo	sqlFunction

HiLink sqlComment	Comment
HiLink sqlFunction	Function
HiLink sqlIdentifier	Identifier
HiLink sqlNumber	Number
HiLink sqlQuotedId	Special
HiLink sqlStatement	Statement
HiLink sqlString	String
HiLink sqlTodo	Todo
HiLink sqlType	Type
HiLink sqlXTType	sqlType
HiLink sqlXTKeyword	sqlKeyword
HiLink sqlVariable	Special

HiLink plsqlBooleanLiteral	Boolean
HiLink plsqlException	Exception
HiLink plsqlLabel	Title
HiLink plsqlParenError	Error
HiLink plsqlPragma	Special
HiLink plsqlpreproc	PreProc
HiLink plsqlTrigger	Keyword
HiLink plsqlType	sqlType

delcommand HiLink

let b:current_syntax = "sql"

" Enormous tab size for column-formatted lists:
" vim:ts=28
