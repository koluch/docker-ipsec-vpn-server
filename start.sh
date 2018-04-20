#!/bin/sh
sudo modprobe af_key

mkdir -p etc/ipsec.d
mkdir -p etc/ppp
touch etc/ipsec.d/passwd
touch etc/ppp/chap-secrets
touch etc/ipsec.secrets

EXTRA_ARGS=
if [ -f etc/pre-up.sh ]; then
    EXTRA_ARGS="-v $PWD/etc/pre-up.sh:/pre-up.sh"
fi

docker-compose up -d
