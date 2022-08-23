" ============================================================================
" Repo: aileot/vim-confirm-quit
" File: plugin/confirm-quit.vim
" Author: aileot
" License: MIT license {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" ============================================================================

if exists('g:loaded_confirm_quit') | finish | endif
let g:loaded_confirm_quit = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

let g:confirm_quit_any_window = get(g:, 'confirm_quit_any_window', 0)
let g:confirm_quit_yes_by_default = get(g:, 'confirm_quit_yes_by_default', 1)

function! s:confirm_quit() abort
  let default_answer = 2
  if g:confirm_quit_yes_by_default
    let default_answer = 1
  endif
  if !g:confirm_quit_any_window && (tabpagenr('$') != 1 || winnr('$') != 1)
    return
  endif
  try
    if confirm('Do you really want to quit?', "&Yes\n&No", default_answer) == 1
      return
    endif
    " A trick to keep the last buffer.
    split %:p
  catch /^Vim:Interrupt$/
    split %:p
  endtry
endfunction

augroup confirm_quit
  au!
  au QuitPre * call s:confirm_quit()
augroup END

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo
