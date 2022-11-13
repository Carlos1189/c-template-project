FROM ubuntu:latest

# install and configuration of ssh
RUN apt-get update && apt-get install openssh-server sudo cmake python3 python3-pip gcc ninja-build nano passwd -y \
    && pip install conan \
    && useradd -m -s /bin/bash carlos\ 
    && yes password | passwd carlos \
    && adduser carlos sudo \
    && echo '%sudo  ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/sudo 
    # && echo "Changing permissions to conan dir. Will take few minutes..." \
    # && chown -R carlos: $CONAN_USER_HOME/.conan
    
# Run the below commands as the user carlos
USER carlos
RUN mkdir -p /home/carlos/.ssh

USER root
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN mkdir /var/run/sshd

USER carlos
CMD ["/entrypoint.sh"]
