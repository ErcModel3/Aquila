FROM ubuntu:24.04 as base
LABEL authors="alex"

RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

# To-do change this to some kind of ssh-key based auth that will work with ansible
RUN useradd -rm -d /home/admin -s /bin/bash -g root -G sudo admin && \
    echo 'admin:admin' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]