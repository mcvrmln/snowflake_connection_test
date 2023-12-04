#!/bin/bash

# generate key

# PRIVATE key
# To generate an encrypted version, use the following command
# expects a password
openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -inform PEM -out ./keys/rsa_key.p8 -passout file:keys/passwd.txt

# PUBLIC key
# From the command line, generate the public key by referencing the private key. 
# expects a password
openssl rsa -in ./keys/rsa_key.p8 -pubout -out ./keys/rsa_key.pub -passin file:keys/passwd.txt
