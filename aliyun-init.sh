#!/bin/sh

package='git'
apt=`which apt-get`
yum=`which yum`

# Update & install dependencies
if [ -n "$apt" ]; then
	# aliyun debian source is broken
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
    apt-get -y install $package
elif [ -n "$yum" ]; then
	yum -y update
    yum -y install $package
else
    echo "Err: no path to apt-get or yum" >&2;
    exit 1;
fi

# install docker & docker compose
curl -sSL https://get.daocloud.io/docker | sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# start docker
systemctl start docker

git clone https://github.com/gongpeione/dst-server-docker.git dst
cd dst
