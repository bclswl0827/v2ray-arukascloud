# Configure V2Ray
cd /v2ray
echo -e '{"inbound":{"port":30000,"listen":"127.0.0.1","protocol":"vmess","settings":{"clients":[{"id":"uuid","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"v2raypath"}}},"outbound":{"protocol":"freedom","settings":{}}}' > config.json
sed -i "s/uuid/$UUID/g" config.json
sed -i "s/v2raypath/$RAY/g" config.json
# Configure Caddy
cd /caddy
sed -i "s/endpoint/$ENDPOINT/g" Caddyfile
sed -i "s/v2raypath/$RAY/g" Caddyfile
sed -i "s/uuid/$UUID/g" wwwroot/config.json
sed -i "s/v2raypath/$RAY/g" wwwroot/config.json
sed -i "s/endpoint/$ENDPOINT/g" wwwroot/config.json
# Run V2Ray & Caddy
nohup /v2ray/v2ray -config=/v2ray/config.json >v2ray.out 2>&1 &
nohup /caddy/caddy -conf=/caddy/Caddyfile >caddy.out 2>&1 &
