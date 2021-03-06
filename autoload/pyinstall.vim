if !exists('g:pyinstall#install_at_startup')
  let g:pyinstall#install_at_startup = 1
endif

if !exists('g:pyinstall#py_version')
  let g:pyinstall#py_version = '3.6.1'
endif

if !exists('g:pyinstall#py_modules')
  let g:pyinstall#py_modules = ['']
endif

if !exists('g:pyinstall#debug')
  let g:pyinstall#debug = 0
endif

let s:plugin_dir = expand('<sfile>:p:h:h') . '/plugin/'
let s:pyenv_dir = expand('<sfile>:p:h:h') . '/pyenv/'

function! pyinstall#install() abort

  let cmd = s:plugin_dir . 'install_env.sh ' . g:pyinstall#py_version . ' ' . join(g:pyinstall#py_modules, ' ')

  if g:pyinstall#debug == 1
    echom 'cmd: ' . cmd
  endif

  let ret = system(cmd)

  if g:pyinstall#debug == 1
    echom ret
  endif

  let g:python3_host_prog = expand(s:pyenv_dir . 'versions/' . g:pyinstall#py_version . '/bin/python')

  if g:pyinstall#debug == 1
    echom 'set g:python3_host_prog ' . g:python3_host_prog
  endif

endfunction
