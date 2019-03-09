# Configure V2Ray
echo -e '{"inbound":{"port":80,"listen":"0.0.0.0","protocol":"vmess","settings":{"clients":[{"id":"uuid","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/ws"}}},"outbound":{"protocol":"freedom","settings":{}}}' > /v2ray/config.json
sed -i "s/uuid/$UUID/g" /v2ray/config.json
# Run V2Ray
/v2ray/v2ray -config=/v2ray/config.json
