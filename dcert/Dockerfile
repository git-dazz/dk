from nginx:stable-alpine

env SITENAME=""
env RENEW=0
env P80=80
env P443=443
expose 80 443

# run apt-get update
run apk update

# run apt install -y openssl certbot python3-certbot-nginx
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
run apk add -f -q openssl certbot certbot-nginx bash && apk cache clean
# run 
add dr.sh /
run chmod +x dr.sh

add Dockerfile /

CMD ["bash", "/dr.sh" ]

# docker build -t ctun/dcert .

# docker run -it --rm \
#     [-p 80:80 -p 443:443]  or [ --net g18 --ip 172.18.0.30] \
#     v  /ssl-file:/wd \
#     -e "SITENAME=example.com"  \
#     ctun/dcert
