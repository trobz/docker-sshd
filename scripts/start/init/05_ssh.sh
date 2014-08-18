#!/bin/bash

ls /usr/local/ssh 2>/dev/null | grep id_rsa &> /dev/null
SSH_AVAILABLE=$?
ls /opt/openerp/.ssh 2>/dev/null | grep id_rsa &> /dev/null
SSH_CONFIGURED=$?


if [[ $SSH_AVAILABLE -ne 0 ]]; then
    warn "Your personal SSH keys are not mounted on this image"
    warn "Please run this image with your personal SSH keys mounted as a volume on /usr/local/ssh"
fi

if [[ $SSH_CONFIGURED -ne 0 ]]; then
    info "Copy personal SSH Key into $USERNAME user .ssh folder..."
    mkdir $USER_HOME/.ssh
    cp /usr/local/ssh/* $USER_HOME/.ssh
    cat $USER_HOME/.ssh/id_rsa.pub >> $USER_HOME/.ssh/authorized_keys 2>/dev/null
    sudo chown $USERNAME: $USER_HOME/.ssh -R
    sudo chmod -rwx,u+rwx $USER_HOME/.ssh -R
fi

success "SSH Server daemon configured"