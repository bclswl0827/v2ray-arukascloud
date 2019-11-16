FROM alpine:3.5
ENV UUID=ad806487-2d26-4636-98b6-ab85cc8521f7 VER=4.18.0
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /v2ray \
 && cd /v2ray \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip /v2ray/v2ray.zip \
 && chmod +x /v2ray/v2ray /v2ray/v2ctl \
 && rm -rf /v2ray/v2ray.zip /v2ray/v2ray.sig /v2ray/v2ctl.sig /v2ray/doc /v2ray/config.json /v2ray/vpoint_socks_vmess.json /v2ray/systemv /v2ray/systemd /v2ray/vpoint_vmess_freedom.json \
 && touch /v2ray/config.json \
 && chgrp -R 0 /v2ray \
 && chmod -R g+rwX /v2ray
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
