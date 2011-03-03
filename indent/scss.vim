" Vim indent file
" Language:	SCSS
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2011 Mar 3

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetSCSSIndent()
setlocal indentkeys=0{,0},!^F,o,O

if exists("*GetSCSSIndent")
  finish
endif

function! GetSCSSIndent()
    let cline = getline(v:lnum)

    " Find a non-blank line above the current line.
    let lnum = prevnonblank(v:lnum - 1)
    " Hit the start of the file, use zero indent.
    if lnum == 0
        return 0
    endif
    let line = getline(lnum)
    let ind = indent(lnum)

    " Indent blocks enclosed by {}, (), or []
    " Find a real opening brace
    let bracepos = match(line, '[(){}\[\]]', matchend(line, '^\s*[)}\]]'))
    while bracepos != -1
        let brace = strpart(line, bracepos, 1)
        if brace == '(' || brace == '{' || brace == '['
            let ind = ind + &sw
        else
            let ind = ind - &sw
        endif
        let bracepos = match(line, '[(){}\[\]]', bracepos + 1)
    endwhile
    let bracepos = matchend(cline, '^\s*[)}\]]')
    if bracepos != -1
        let ind = ind - &sw
    endif

    return ind
endfunction
" vim:set sw=2: