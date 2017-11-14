#!/bin/sh

mv /etc/apt/sources.list.d/sources-aliyun-0.list /etc/apt/sources.list.d/sources-aliyun-0.list.bak

tee /etc/apt/sources.list << EOF
deb http://mirrors.163.com/debian/ jessie main non-free contrib
deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib
deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
EOF

apt-get update
curl -sSL https://get.daocloud.io/docker-test | sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt-get install -y git
git clone https://github.com/gongpeione/dst-server-docker.git dst
cd dst
git checkout geeku
docker-compose up -d
