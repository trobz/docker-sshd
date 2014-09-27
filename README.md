## Description

This docker image setup a SSH server, allowing ssh access into the container.

## Dependency

This image is based on `trobz/supervisord` and `trobz/ubuntu`.

## Features

### Service start

The sshd service managed by supervisord.

### User access

It's not required, but if your public ssh keys (`id_rsa.pub`) is mounted as a volume on `/usr/local/ssh/id_rsa.pub`, the public key will be automatically added to default user `.ssh/authorized_keys` and no password will be asked at user connection.

### VIM setup

If you like VIM, the container can set up it for you with some default useful plugins, out of the box.
To activate this feature, you have to set the env `VIM_SETUP=1`.

#### VIM plugin pre-installed:

- [neobundle](https://github.com/Shougo/neobundle.vim): VIM plugin manager
- [bufexplorer](https://github.com/jlanzarotta/bufexplorer): improve the navigation between buffers
- [nerdtree](https://github.com/scrooloose/nerdtree): add a folder tree view to navigate between files
- [syntastic](https://github.com/scrooloose/syntastic): check the code syntax 
- [airline](https://github.com/bling/vim-airline): improve the status bar. If the env `LC_POWERFONT` is set to 1, 
vim-airline will use special powerline font.  
- [fugitive](https://github.com/tpope/vim-fugitive): GIT support
- [python-mode](https://github.com/klen/python-mode): extra VIM feature for python (PEP8, completion, run, debug)


## Build

Same as `trobz/ubuntu`, `./build.sh` is used to generated a Dockerfile for each ubuntu version.
