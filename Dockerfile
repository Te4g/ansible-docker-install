FROM ubuntu:latest

RUN apt update && apt install -y \
    ssh \
    sudo

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu

RUN echo 'ubuntu:ubuntu' | chpasswd

RUN mkdir -p /home/ubuntu/.ssh

RUN --mount=type=secret,id=ssh_key cat /run/secrets/ssh_key > /home/ubuntu/.ssh/authorized_keys

RUN service ssh start

CMD ["/usr/sbin/sshd", "-D"]
