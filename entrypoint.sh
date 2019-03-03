echo -e '{"inbound":{"port":3050,"listen":"127.0.0.1","protocol":"vmess","settings":{"clients":[{"id":"$UUID","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"$V2RAYPATH"}}},"outbound":{"protocol":"freedom","settings":{}}}' > /v2ray/config.json
screen -dmS v2ray /v2ray/v2ray -config=/v2ray/config.json
screen -dmS caddy /caddy/caddy -conf=/caddy/Caddyfile
