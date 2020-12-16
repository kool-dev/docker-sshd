# kool-dev/docker-sshd

![CI/CD](https://github.com/kool-dev/docker-sshd/workflows/CI/CD/badge.svg)

Very simple docker image for running a SSH Server based on Alpine.

Username will be created with suffix that end the env `AUTHORIZED_KEYS_` converted to lowercase, or by suffix that file name `authorized_keys_` 

* Adding and env variable `AUTHORIZED_KEYS_USERNAME`
* Mounting a file at `/authorized_keys_username`

## Usage

### Env Variable

```bash
AUTHORIZED_KEYS=$(cat authorized_keys.txt)

docker run --rm --init -p22:22 -e AUTHORIZED_KEYS_USER1=${AUTHORIZED_KEYS} -e AUTHORIZED_KEYS_USER2=${AUTHORIZED_KEYS} kooldev/sshd
```

This example will create `/home/retool/.ssh/authorized_keys` and `/home/kool/.ssh/authorized_keys`

### Mount File

```bash
docker run --rm --init -p22:22 -v "$(pwd)/authorized_keys_user1:/authorized_keys_user1" -v "$(pwd)/authorized_keys_user2:/authorized_keys_user2" kooldev/sshd
```

That's it, now you can ssh in:

```
ssh kool@localhost
```
