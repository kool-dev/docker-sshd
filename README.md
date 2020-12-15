# kool-dev/docker-sshd

![CI/CD](https://github.com/kool-dev/docker-sshd/workflows/CI/CD/badge.svg)

Very simple docker image for running a SSH Server based on Alpine.

By default it has a user `kool` and can only be logged using SSH Keys by:

* Adding and env variable `AUTHORIZED_KEYS`
* Mounting a file at `/authorized_keys`

## Usage

### Env Variable

```bash
AUTHORIZED_KEYS=$(cat authorized_keys.txt)

docker run --rm --init -p22:22 -e AUTHORIZED_KEYS=${AUTHORIZED_KEYS} kooldev/sshd
```

To create new user and add the authorized keys to this user, add username with an suffix to `AUTHORIZED_KEYS` as in the example.  
Username will be converted to lowercase
```bash
AUTHORIZED_KEYS=$(cat authorized_keys.txt)

docker run --rm --init -p22:22 -e AUTHORIZED_KEYS=${AUTHORIZED_KEYS} -e AUTHORIZED_KEYS_RETOOL=${AUTHORIZED_KEYS} kooldev/sshd
```

This example will create `/home/retool/.ssh/authorized_keys` and `/home/kool/.ssh/authorized_keys`

### Mount File

```bash
docker run --rm --init -p22:22 -v "$(pwd)/authorized_keys:/authorized_keys" kooldev/sshd
```

That's it, now you can ssh in:

```
ssh kool@localhost
```
