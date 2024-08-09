From alpine
# server https port or client https_proxy port 
EXPOSE 443 
# client socks5_proxy port 
EXPOSE 1080
# client http_proxy port 
EXPOSE 80


run mkdir /tgo 
# run  apt-get update && apt-get install -y ca-certificates && apt-get autoclean; rm -rf /var/lib/apt/lists/*
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
run  apk update && apk add -f -q --clean-protected bash ca-certificates && apk cache clean

WORKDIR /tgo

# gost & trojan-go
# gost      https://github.com/go-gost/gost/releases
# trojan-go https://github.com/gfw-report/trojan-go/releases # current
#           https://github.com/p4gefau1t/trojan-go/releases
add     gost \
        trojan-go geoip.dat  geoip-only-cn-private.dat  geosite.dat \
        dr.sh Dockerfile \
        /tgo/

run chmod +x dr.sh

CMD ["/tgo/dr.sh"]

# # server 
# docker run -it --restart=always  --name tgo \
#         --net g18 --ip 172.18.0.31  \
#         -v $PWD:/config  \
#         /ssl-file:/ssl-file \
#         ctun/tgo

# # client
# docker run -it --rm  --name tgo 
#         --net b18 --ip 172.18.2.1  \
#         -v $PWD:/config  \
#         ctun/tgo
