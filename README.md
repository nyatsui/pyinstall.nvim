# pyinstall.nvim

This is a vimscript for installing python environment dedicated of vim independently from your system python environment.
MacOS and Linux are only supported.  
It is tested on macOS Mojave and Ubuntu 18.04.

## Usage:

Define python version and python modules which you want to install.
pynvim module is installed as default.
If you use init.vim, add the following lines to init.vim.
You must add these lines before dein install script.

    " Python3 install
    let s:pyinstall_cache_path = expand('~/.cache/nvim/pyinstall.nvim')
    if &runtimepath !~ '/pyinstall.nvim'
      let g:pyinstall#py_version = '3.6.1'
      let g:pyinstall#py_modules = ['']
      if !isdirectory(s:pyinstall_cache_path)
        execute '!git clone --recursive https://github.com/nyatsui/pyinstall.nvim.git' s:pyinstall_cache_path
      endif
      execute 'set runtimepath+=' . s:pyinstall_cache_path
      call pyinstall#install()
    endif

