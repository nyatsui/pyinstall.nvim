" windows is not supported yet
if has('win32') || has('win64')
  finish
endif

if exists('g:loaded_pyinstall')
  finish
endif
let g:loaded_pyinstall = 1
let s:script_dir = expand('<sfile>:p:h')

call pyinstall#install(s:script_dir)
