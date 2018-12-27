
function! pyinstall#install(script_dir) abort

  let cmd = a:script_dir . '/install_env.sh ' . g:pyinstall#py_version . ' ' . g:pyinstall#envname . ' ' . join(g:pyinstall#py_modules, ' ')
  " echom cmd
  let ret = system(cmd)
  echom ret

  let g:python3_host_prog = expand(a:script_dir . '/pyenv/versions/' . g:pyinstall#envname . '/bin/python')
  echom 'set g:python3_host_prog ' . g:python3_host_prog

endfunction
