FROM alpine:3.12

ENV AUTHORIZED_KEYS=""
ENV SSH_USERNAME="kool"

RUN apk --no-cache add bash openssh && \
    ssh-keygen -A && \
    sed -i s/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/ /etc/ssh/sshd_config && \
    sed -i s/^AllowTcpForwarding\ no/AllowTcpForwarding\ yes/ /etc/ssh/sshd_config

COPY entrypoint /entrypoint

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
CMD [ "/usr/sbin/sshd", "-D", "-e" ]
