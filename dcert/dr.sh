#!/bin/bash

if [ "$SITENAME" = "" ] ;then
    echo "SITENAME is must";
    exit 1;
fi

echo "server { \
    listen       80; \
    server_name  localhost $SITENAME;\

    location / {\
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

}" > /etc/nginx/conf.d/default.conf


certbot --version; 

certbot --nginx --register-unsafely-without-email --key-type ecdsa  \
   --https-port $P443 --http-01-port $P80 \
   --agree-tos -d $SITENAME

cp -rL /etc/letsencrypt/live/$SITENAME /wd
cp -L /etc/letsencrypt/ssl-dhparams.pem /wd

cd /wd/$SITENAME/

openssl x509 -in fullchain.pem -out fullchain.crt
openssl ec -in privkey.pem -out privkey.key
