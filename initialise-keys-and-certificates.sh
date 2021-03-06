#!/bin/sh

echo "Initialising keys and certificates"

export CONFIG_DIR=nginx/build/config/nginx

createKeyAndCertificate() {
  certificate=$1/certs/$2.crt
  if [[ ! -f ${certificate} ]] ; then
    properties=$1/certs/$2.properties
    echo "creating   : ${certificate}"
    mkdir -p $1/keys
    mkdir -p $1/certs
    openssl genrsa -out $1/keys/$2.key 2048
    subject="/C=EN/CN=localhost"
    openssl req -new -x509 -subj "${subject}" -key $1/keys/$2.key -out ${certificate} && \
      echo "... created : ${certificate}"
  else
    echo "exists  : ${certificate}"
    openssl x509 -in ${certificate} -text -noout | grep "Subject:"
  fi
  echo
}

createKeyAndCertificate ${CONFIG_DIR} "chat"

# Generate Strong Diffie Helman group for SSL key exchange

if [[ ! -f "${CONFIG_DIR}/dhparams.pem" ]] ; then
  openssl dhparam -out ${CONFIG_DIR}/dhparams.pem 2048
fi