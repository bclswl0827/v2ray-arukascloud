# V2Ray ArukasCloud

## 概述

用于在 ArukasCloud 上部署 V2Ray Websocket。

**与 Openshift 一样，ArukasCloud 为我们提供了免费的容器服务，我们不应该滥用它。正因如此，如果您使用的是 ArukasCloud 的免费套餐，本项目不宜做为长期翻墙使用。**

**ArukasCloud 在中国被 TCP 阻断，所以目前只能使用 Endpoint 的带 HTTPS 的固定地址来访问。**

**ArukasCloud 的网络并不稳定，部署前请三思。**

## 镜像

 - DockerHub 的镜像：`bclswl0827/v2ray-arukascloud`。
 
## ENV 设定
 
### UUID

`UUID` > `您自己的 UUID`。

如果不填，将默认为 `dd4523c3-fa0a-4aa3-acfe-0a49c7f643ce`。

### VER

`VER` > `V2Ray 版本号`。

如果不填，将默认为 `4.15.0`。

## V2Ray 的路径

镜像启动之后，路径为 `/ws`。手动探测 `https://example.arukascloud.io/ws` 出现 `Bad Request` 即可初步判断 `V2Ray` 已经在运行。同时，由于 GFW 并不能看到路径，故 V2Ray 的路径在何处都无所谓。
