cd /v2ray
echo -e '{"inbound":{"port":30000,"listen":"127.0.0.1","protocol":"vmess","settings":{"clients":[{"id":"uuid","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"v2raypath"}}},"outbound":{"protocol":"freedom","settings":{}}}' > config.json
sed -i "s/uuid/$UUID/g" config.json
sed -i "s/v2raypath/$V2RAYPATH/g" config.json
./v2ray
