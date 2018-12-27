# pyinstall.nvim

This is a vimscript for installing python environment dedicated of vim independently from your system python environment.
MacOS and Linux are only supported.

## Usage:

Define python version, env name and python modules which you want to install.
pynvim and neovim are installed as default.

    let g:pyinstall#py_version = '3.6.1'
    let g:pyinstall#envname = 'nvim-env'
    let g:pyinstall#py_modules = ['']


## Install:

If you use dein.vim, add the following lines.

    [[plugins]]
    repo = 'nyatsui/pyinstall.nvim'
    hook_add = '''
    let g:pyinstall#py_version = '3.6.1'
    let g:pyinstall#envname = 'nvim-env'
    let g:pyinstall#py_modules = ['']
    '''
