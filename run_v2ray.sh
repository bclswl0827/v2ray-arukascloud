cd /v2ray
echo -e '{"inbound":{"port":3050,"listen":"127.0.0.1","protocol":"vmess","settings":{"clients":[{"id":""$UUID"","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":""$V2RAYPATH""}}},"outbound":{"protocol":"freedom","settings":{}}}' > config.json
./v2ray
