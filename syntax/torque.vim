" Vim syntax file
" Language:	TorqueScript
" Maintainer:	Eric Roberts <ericroberts AT rogers.com>
" Last Change:	2008 Jan 02

" Quit when a (custom) syntax file was already loaded

if exists("b:current_syntax")
   finish
endif

syn case ignore

" A bunch of useful TorqueScript keywords
syn keyword	tsStatement	new break return continue
syn keyword	tsFunction	function 
syn keyword	tsLabel		case default
syn keyword	tsConditional	if else switch switch$
syn keyword	tsRepeat	while for
syn keyword	tsStructure	datablock package
syn keyword 	tsConstant 	true false
syn keyword	tsTodo		contained TODO FIXME XXX

" TorqueScript operators
syn match	tsStringOp	"\(\<SPC\>\|\<NL\>\|\<TAB\>\|@\)"
syn match	tsBinMathOp	"\(+\|-\|*\|/\|%\)" contains=tsErrorIncr
syn match	tsUnaryMathOp	"\(+=\|-=\|*=\|/=\)"
syn match	tsAssignmentOp	"="
syn match	tsCompareOp	"\(<\|>\|>=\|<=\|$=\|!$=\|==\|!=\)"
syn match	tsLogicOp	"\(&&\|||\|!\)"
syn match	tsBitLogic1Op	"\(|\|&\|^\|\~\|<<\|>>\)"
syn match	tsBitLogic2Op	"\(|=\|&=\|^=\|\~=\|<<=\|>>=\)"

syn match	tsQuestionOp	"?"
syn match	tsColonOp	":"

" Prefix TorqueScript Error
syn match	tsErrorIncr	"\(++\|--\)\($\|%\)\<\h[a-zA-Z0-9_:]*\>"

" TorqueScript numbers
syn match	tsInteger	"\<\(-\|+\)\?\d\+\>" 
syn match	tsFloat		"\<\(-\|+\)\?\d\+\.\d\+\([eE]\(+\|-\)\?\d\+\)\?\>" 
syn match	tsHex		"\<0x\x\+\>" 

" TorqueScript format characters in strings
syn match	tsFormat	"\\\(x\x\x\|n\|r\|t\|c[0-9]\|cr\|cp\|co\|\\\)" display contained

" TorqueScript string
syn region	tsString	start=/"/ skip=/\\"/ end=/"/ contains=tsFormat
syn region	tsTaggedString	start=/'/ skip=/\\'/ end=/'/ contains=tsFormat

" TorqueScript comments
syn match	tsComment	;//.*; contains=tsTodo
syn region	tsComment	start=;\/\*; end=;\*\/; fold contains=tsTodo

" TorqueScript variables
syn match	tsGlobal	"$\<\h[a-zA-Z0-9_:]*\>" 
syn match	tsLocal		"%\<\h[a-zA-Z0-9_:]*\>"
syn match	tsThisId	"\(function\s\+\h\w*::\h\w*\_s*(\_s*\)\@<=\(%\h\w*\)"
"syn match	tsThisId	"\(function\s\+\h\w*::\h\w*(\)\@<=\(%\h\w*\)"

" TorqueScript Parent keyword - needs special treatment
syn match       tsParent        "parent\([ \t]*::\)\@="

" TorqueScript block
syn region	tsBlock		start=/{/ end=/}/ transparent fold contains=ALL

hi def link tsStatement		Statement
hi def link tsFunction		Function
hi def link tsStructure		Structure

hi def link tsStringOp		Operator
hi def link tsBinMathOp		Operator
hi def link tsUnaryMathOp	Operator
hi def link tsAssignmentOp	Operator
hi def link tsCompareOp		Operator
hi def link tsLogicOp		Operator
hi def link tsBitLogic1Op	Operator
hi def link tsBitLogic2Op	Operator

hi def link tsQuestionOp	Operator
hi def link tsColonOp		Operator

hi def link tsLabel		Label
hi def link tsConditional	Conditional
hi def link tsRepeat            Repeat

hi def link tsParent            Keyword

hi def link tsString		String
hi def link tsFormat		Character

hi def link tsInteger		Number
hi def link tsHex		Number
hi def link tsFloat		Float

hi def link tsComment		Comment
hi def link tsTodo		Todo

"Highlight globals as special - is there a better choice?
hi def link tsGlobal		Special
hi def link tsLocal		Identifier

hi def link tsConstant		Constant

" No real good choice for this highlighting type
" Highlight as a special as the first param (even though its local)
" TODO: Highlight occurances of %this in function body?
hi def link tsThisId		Special

" Errors
hi def link tsErrorIncr		Error

let b:current_syntax = "torquescript"
