## Description

This docker image setup a SSH server, allowing ssh access into the container.

## Dependency

This image is based on `trobz/supervisord` and `trobz/ubuntu`.

## Features

### Service start

The sshd service managed by supervisord.

### User access

It's not required, but if a folder with ssh keys (`id_rsa` and `id_rsa.pub`) is mounted as a volume on `/usr/local/ssh`, the public key
will be automatically added to default user `.ssh/authorized_keys` and no password will be asked at user connection.

## Build

Same as `trobz/ubuntu`, `./build.sh` is used to generated a Dockerfile for each ubuntu version.