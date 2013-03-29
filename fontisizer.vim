if &cp || exists("g:loaded_fontisizer")
    finish
endif
let g:loaded_fontisizer = 1

let s:save_cpo = &cpo
set cpo&vim

" keep default value
let s:current_font = &guifont

" command
command! -narg=1 FontiSizer    :call s:FontiSizer(<f-args>)
command! -narg=0 FontiSizerReset :call s:FontiSizerReset()

" map
nmap <A-=> :FontiSizer( 1 )<CR>
nmap <A--> :FontiSizer( -1 )<CR>

" guifont size + 1
function! s:FontiSizer( ... )
  " Must do some wierdness and treat the arguments like a list... ?
  let l:delta = a:1[2:-2]
  "echo l:delta
  let l:fsize = substitute(&guifont, '^\D\+\(\d\+\)\D*$', '\1', '')
  "echo l:fsize
  let l:fsize = l:delta + l:fsize
  let l:guifont = substitute(&guifont, '^\(\D\+\)\(\d\+\)\(\D*\)$', '\1'.l:fsize.'\3', '')
  let &guifont = l:guifont
  echo l:guifont
endfunction

" reset guifont size
function! s:FontiSizerReset()
  let &guifont = s:current_font
endfunction

let &cpo = s:save_cpo
finish

==============================================================================
fontisizer.vim : control gui font size with "+" or "-" keys.
------------------------------------------------------------------------------
$VIMRUNTIMEPATH/plugin/fontisizer.vim
==============================================================================
author  : OMI TAKU
modifier: stephen meckley
url     : http://nanasi.jp/
email   : mail@nanasi.jp
version : 2008/07/18 10:00:00
version : 2013/02/28 10:00:00
==============================================================================

Control Vim editor font size with key "+", or key "-".
Actually its Alt-= and Alt--
Press "+" <Alt-=> key, Vim editor gui font size will change bigger.
And, press "-" <Alt--> key, Vim editor gui font size will change smaller.

This plugin is for GUI only.


Normal Mode:
    <Alt-=>             ... change font size bigger
    <Alt-->             ... change font size smaller

Command-line Mode:
    :FontiSizer          ... change font size smaller
    :FontiSizerReset     ... reset font size changes.

==============================================================================

1. Copy the font_sizer.vim script to
   $HOME/vimfiles/plugin or $HOME/.vim/plugin directory.
   Refer to ':help add-plugin', ':help add-global-plugin' and
   ':help runtimepath' for more details about Vim plugins.

2. Restart Vim.

==============================================================================
" vim: set ff=unix et ft=vim nowrap 
