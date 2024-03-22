if !exists('g:pyinstall#install_at_startup')
  let g:pyinstall#install_at_startup = 1
endif

if !exists('g:pyinstall#py_modules')
  let g:pyinstall#py_modules = ['']
endif

if !exists('g:pyinstall#debug')
  let g:pyinstall#debug = 0
endif

let s:plugin_dir = expand('<sfile>:p:h:h') . '/plugin/'
let g:python3_host_prog = expand('<sfile>:p:h:h') . '/env/bin/python'

function! pyinstall#install() abort

  let cmd = s:plugin_dir . 'install_env.sh ' . ' ' . join(g:pyinstall#py_modules, ' ')

  if g:pyinstall#debug == 1
    echom 'cmd: ' . cmd
  endif

  let ret = system(cmd)

  if g:pyinstall#debug == 1
    echom ret
    echom expand('<sfile>')
  endif

  if g:pyinstall#debug == 1
    echom 'set g:python3_host_prog ' . g:python3_host_prog
  endif

endfunction
