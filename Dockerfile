FROM alpine:latest

ENV UUID=dd4523c3-fa0a-4aa3-acfe-0a49c7f643ce V2RAYVER=4.15.0 V2RAYPATH=/ws CADDYVER=0.11.4 ENDPOINT=none

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /v2ray /caddy /caddy/wwwroot \
 && cd /v2ray \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$V2RAYVER/v2ray-linux-64.zip \
 && unzip /v2ray/v2ray.zip \
 && chmod +x /v2ray/v2ray /v2ray/v2ctl \
 && rm -rf /v2ray/v2ray.zip /v2ray/v2ray.sig /v2ray/v2ctl.sig /v2ray/doc /v2ray/config.json /v2ray/vpoint_socks_vmess.json /v2ray/systemv /v2ray/systemd /v2ray/vpoint_vmess_freedom.json \
 && touch /v2ray/config.json \
 && cd /caddy \
 && curl -L -H "Cache-Control: no-cache" -o caddy.tar.gz https://github.com/mholt/caddy/releases/download/v$CADDYVER/caddy_v$CADDYVER_linux_amd64.tar.gz \
 && tar -xzf /caddy/caddy.tar.gz -C /caddy \
 && chmod +x /caddy/caddy \
 && rm -rf /caddy/init /caddy/CHANGES.txt /caddy/README.txt /caddy/LICENSES.txt /caddy/EULA.txt \
 && echo -e "0.0.0.0:80 {\n    root /caddy/wwwroot\n    timeouts 10m\n    proxy /ws 127.0.0.1:3050 {\n        websocket\n        header_upstream -Origin\n    }\n}" > /caddy/Caddyfile \
 && echo -e '{"inbounds":[{"port":1080,"listen":"127.0.0.1","protocol":"socks","sniffing":{"enabled":true,"destOverride":["http","tls"]},"settings":{"auth":"noauth","udp":false}}],"outbounds":[{"protocol":"vmess","settings":{"vnext":[{"address":"$ENDPOINT.arukascloud.io","port":443,"users":[{"id":"$UUID","alterId":64}]}]},"streamSettings":{"network":"ws","security":"tls","wsSettings":{"path":"$V2RAYPATH"}}}]}' > /caddy/wwwroot/config.json \
 && chgrp -R 0 /v2ray /caddy \
 && chmod -R g+rwX /v2ray /caddy

ADD index.html /caddy/wwwroot/index.html

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
