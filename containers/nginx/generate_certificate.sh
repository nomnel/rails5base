#!/bin/sh

# original: http://www.bunkei-programmer.net/entry/2014/06/24/232915

openssl genrsa 2048 > server.key

#------------------------------------------------------------
# Country Name (2 letter code) [AU]:
# State or Province Name (full name) [Some-State]:
# Locality Name (eg, city) []:
# Organization Name (eg, company) [Internet Widgits Pty Ltd]:
# Organizational Unit Name (eg, section) []:
# Common Name (e.g. server FQDN or YOUR name) []:
# Email Address []:
#
# Please enter the following 'extra' attributes
# to be sent with your certificate request
# A challenge password []:
# An optional company name []:
#------------------------------------------------------------
openssl req -new -key server.key <<EOF > server.csr
JP
Tokyo
Neet Town
Neet Company
Neet Section
192.168.33.21



EOF

openssl x509 -days 3650 -req -signkey server.key < server.csr > server.crt
