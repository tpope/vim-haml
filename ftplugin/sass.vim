" Vim filetype plugin
" Language:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2016 Aug 29

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl com< cms< def< inc< inex< isk< ofu< sua<"

setlocal comments=://
setlocal commentstring=//\ %s
setlocal includeexpr=SassIncludeExpr(v:fname)
setlocal iskeyword+=-
setlocal iskeyword+=$
setlocal iskeyword+=%
setlocal omnifunc=csscomplete#CompleteCSS
setlocal suffixesadd=.sass,.scss,.css

let &l:define = '^\C\v\s*%(\@function|\@mixin|\=)|^\s*%(\$[[:alnum:]-]+:|[%.][:alnum:]-]+\s*%(\{|$))@='
let &l:include = '^\s*@import\s\+\%(url(\)\=["'']\='

function! SassIncludeExpr(file) abort
  let partial = substitute(a:file, '\%(.*/\|^\)\zs', '_', '')
  if !empty(findfile(partial))
    return partial
  endif
  return a:file
endfunction

" vim:set sw=2:
