#!/bin/bash

# Install dst's dependencies
dpkg --add-architecture i386 &&
apt-get update &&
apt-get install -y libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386

# Install Steam
mkdir /root/steamcmd &&
cd /root/steamcmd

apt-get install -y wget &&
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz &&
tar -xvzf steamcmd_linux.tar.gz

# Install or update Don't Starve Togehter
/root/steamcmd/steamcmd.sh \
  +force_install_dir /root/dst/ \
  +login anonymous \
  +app_update 343050 \
  validate +quit