#!/bin/bash
# Update and run Don't Starve Togehter
/root/steamcmd/steamcmd.sh \
  +force_install_dir /root/dst/ \
  +login anonymous \
  +app_update 343050 \
  validate +quit &&
/root/dst/bin/dontstarve_dedicated_server_nullrenderer \
  persistent_storage_root \
  /root/.klei "$@"