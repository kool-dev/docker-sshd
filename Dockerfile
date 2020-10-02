FROM alpine:3.12

ENV AUTHORIZED_KEYS=""

RUN adduser -D -u 1337 kool && \
    passwd -u kool && \
    apk --no-cache add bash openssh && \
    mkdir /home/kool/.ssh && \
    chmod 700 /home/kool/.ssh && \
    chown kool:kool /home/kool/.ssh && \
    ssh-keygen -A && \
    sed -i s/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/ /etc/ssh/sshd_config

COPY entrypoint /entrypoint

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
CMD [ "/usr/sbin/sshd", "-D", "-e" ]
