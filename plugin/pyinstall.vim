" windows is not supported yet
if has('win32') || has('win64')
  finish
endif

if exists('g:loaded_pyinstall')
  finish
endif
let g:loaded_pyinstall = 1

if g:pyinstall#install_at_startup == 1
  call pyinstall#install()
endif
