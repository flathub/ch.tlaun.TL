#!/usr/bin/env bash

TL_BRAND=${TL_BRAND:-legacy}

TL_BOOTSTRAP_OPTIONS=${TL_BOOTSTRAP_OPTIONS:--Dtlauncher.bootstrap.requireMinecraftAccount}

declare -a tlBootstrapOptions

IFS=" " read -r -a tlBootstrapOptions <<< "$TL_BOOTSTRAP_OPTIONS"

for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

exec java "${tlBootstrapOptions[@]}" -jar /app/lib/tl/bootstrap.jar \
  --ignoreSelfUpdate \
  --brand="$TL_BRAND" \
  --targetJar=/var/data/launcher.jar \
  --targetLibFolder=/var/data/libraries \
  --packageMode=flatpak \
  -- \
  --settings=/var/config/tl.properties \
  --directory=/var/data/game \
  --jre-dir=/var/data/jre \
  "$@"
