# Don't Starve Together Server 

---

This is an easy-to-build don't starve together(dst) server based on docker, refer to [protometa/dst](https://github.com/protometa/dst). You can easily build a dst server(including mod support and caves) by following steps below.

## Step 1: Install Docker and Docker compose
---
The first thing you need to do is install docker and docker compose.
### Install Docker

[Get Started with docker](https://www.docker.com/products/docker)

### Install Docker compose

[Install docker compose](https://docs.docker.com/compose/install/)

### 天朝用户

天朝用户可以使用Daocloud提供的脚本进行安装

[安装 Docker](https://get.daocloud.io/#install-docker)

## Step 2: Clone or download project
---
Clone or download this project.

If you have git enviroment.clone it.

```
git clone https://github.com/gongpeione/dst-server-docker.git
```

or

[Download master.ip](https://github.com/gongpeione/dst-server-docker/archive/master.zip)

## Step 3: Modify configuration files
---
### server token

Paste your server token in `configs/cluster/cluster_token.txt`.If you don't know how to get your token,please follow this tutorial [4. Create your cluster_token.txt](http://forums.kleientertainment.com/topic/64441-dedicated-server-quick-setup-guide-linux/).

### configuration files

Modify `configs/cluster/cluster.ini`,these items are important:

- `cluster_name` Your room's name.
- `cluster_password` Your room's password,don't leave it empty if you don't want anybody else enter your dst world.

If you want to know what other items do,read this article [Dedicated Server Settings Guide](http://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/).

### mod

Setup mods by modify `configs/mods/dedicated_server_mods_setup.lua`.You can open this file by any editor to see how to setup mods.And maybe you need to modify `configs/cluster/Master/modoverrides.lua` and `configs/cluster/Caves/modoverrides.lua` to make mods work.

## Step 4: Start server
---

```
docker-compose up -d
```

and that's it.


```
docker-compose restart //Update server
```
