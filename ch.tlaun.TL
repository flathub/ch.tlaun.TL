#!/usr/bin/env bash

TL_BRAND=${TL_BRAND:-legacy}

TL_BOOTSTRAP_OPTIONS=${TL_BOOTSTRAP_OPTIONS:--Dtlauncher.bootstrap.requireMinecraftAccount}

declare -a tlBootstrapOptions

IFS=" " read -r -a tlBootstrapOptions <<< "$TL_BOOTSTRAP_OPTIONS"

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
