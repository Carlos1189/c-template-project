#!/bin/sh
set -xe

# installing ssh keys
cp -a ${TMP_SSH_DIR}/${SSH_KEY} ~/.ssh/id_rsa
chown -R ${USER}: ~/.ssh
chmod 0600 ~/.ssh/id_rsa
cat ${TMP_SSH_DIR}/${SSH_KEY}.pub >> ~/.ssh/authorized_keys
chmod 0644 ~/.ssh/authorized_keys

# saving all ENV vars into /etc/environment to be accessible after ssh login
# else, are stripped by sshd
env | grep "_" | sudo tee -a /etc/environment

sudo /usr/sbin/sshd -D
