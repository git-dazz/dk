#!/bin/bash


ls -la /ssl-file;

MODE="server"

if [ ! -d "/ssl-file" ];then
  MODE="client";
fi

echo "$MODE";

if [ $MODE = "server" ] ; then 

./trojan-go -config /config/server.json

fi

if [ $MODE = "client" ] ; then 

  echo "http_proxy 80"
  echo "https_proxy 443 | maybe error"
  echo "socks5_proxy 1080"

./gost -L http://:80 -L https://:443 -F socks5://0.0.0.0:1080 &

./trojan-go -config /config/client.json

fi

