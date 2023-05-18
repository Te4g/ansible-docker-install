FROM ubuntu:latest as builder
RUN apt update && apt install -y ssh

FROM builder as ubuntu
RUN apt install -y sudo
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
RUN echo 'ubuntu:ubuntu' | chpasswd
RUN mkdir -p /home/ubuntu/.ssh
RUN --mount=type=secret,id=ssh_key cat /run/secrets/ssh_key > /home/ubuntu/.ssh/authorized_keys
CMD ["/bin/bash", "-c", "service ssh start ; tail -f /dev/null"]

FROM builder as ubuntu-root
RUN echo 'root:root' | chpasswd
RUN sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
CMD ["/bin/bash", "-c", "service ssh start ; tail -f /dev/null"]
