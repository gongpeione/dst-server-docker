FROM ubuntu:latest

MAINTAINER gongpeione <ggongpei@gmail.com>

# Init,install dependencies,steam and Don't Starve Togehter
WORKDIR /root/bin
ADD dst-init.sh ./dst-init.sh
RUN chmod +x ./dst-init.sh
RUN ./dst-init.sh

# Add entry file
ADD entry.sh ./entry.sh
RUN chmod +x ./entry.sh

# Add config files
ADD configs/ /root/.klei/DoNotStarveTogether/Cluster_1/

# Volume
VOLUME /root/

# Port
EXPOSE 10889

# Entrypoint
WORKDIR /root/dst/bin
ENTRYPOINT ["/root/bin/entry.sh"]
