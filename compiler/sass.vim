" Vim compiler file
" Compiler:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2013 May 30

if exists("current_compiler")
  finish
endif
let current_compiler = "sass"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

if !exists("g:sass_make_options")
  let g:sass_make_options = "-C --unix-newlines"
endif

if exists("g:really_compile_sass")
  execute "CompilerSet makeprg=sass\\ " .
  \        escape(g:sass_make_options, " ") . "\\ " .
  \        "$*\\ " .
  \        fnameescape(expand("%")) . "\\ " .
  \        fnameescape(expand("%:r")) . ".css"
else
  CompilerSet makeprg=sass\ -c
endif

CompilerSet errorformat=
      \%f:%l:%m\ (Sass::Syntax%trror),
      \%ESyntax\ %trror:%m,
      \%C%\\s%\\+on\ line\ %l\ of\ %f,
      \%Z%.%#,
      \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2:
