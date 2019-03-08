FROM alpine:latest

ENV UUID=dd4523c3-fa0a-4aa3-acfe-0a49c7f643ce VER=4.15.0

RUN apk add --no-cache --virtual .build-deps ca-certificates curl screen \
 && mkdir -m 777 /v2ray /caddy /caddy/wwwroot \
 && cd /v2ray \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip /v2ray/v2ray.zip \
 && chmod +x /v2ray/v2ray /v2ray/v2ctl \
 && rm -rf /v2ray/v2ray.zip /v2ray/v2ray.sig /v2ray/v2ctl.sig /v2ray/doc /v2ray/config.json /v2ray/vpoint_socks_vmess.json /v2ray/systemv /v2ray/systemd /v2ray/vpoint_vmess_freedom.json \
 && touch /v2ray/config.json /caddy/Caddyfile \
 && cd /caddy \
 && echo -e "0.0.0.0:80 {\n    root /caddy/wwwroot\n    gzip\n    tls off\n    proxy /ws 127.0.0.1:30000 {\n        websocket\n        header_upstream -Origin\n    }\n}" > /caddy/Caddyfile \
 && chgrp -R 0 /v2ray /caddy \
 && chmod -R g+rwX /v2ray /caddy

ADD index.html /caddy/wwwroot/index.html

ADD run.sh /run.sh

ADD caddy /caddy/caddy

RUN chmod +x /run.sh /caddy/caddy

ENTRYPOINT /run.sh

EXPOSE 80
