cd /caddy
sed -i "s/endpoint/$ENDPOINT/g" Caddyfile
sed -i "s/uuid/$UUID/g" wwwroot/config.json
sed -i "s/v2raypath/$V2RAYPATH/g" wwwroot/config.json
sed -i "s/endpoint/$ENDPOINT/g" wwwroot/config.json
./caddy
