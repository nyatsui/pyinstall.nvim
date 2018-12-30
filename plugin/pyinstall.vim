" windows is not supported yet
if has('win32') || has('win64')
  finish
endif

if exists('g:loaded_pyinstall')
  finish
endif
let g:loaded_pyinstall = 1

let s:plugin_dir = expand('<sfile>:p:h')
let g:python3_host_prog = expand(s:plugin_dir . 'pyenv/versions/' . g:pyinstall#envname . '/bin/python')
