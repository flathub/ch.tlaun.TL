#!/usr/bin/env bash

TL_IGNORE_SELF_UPDATE=${TL_IGNORE_SELF_UPDATE:-true}
TL_BRAND=${TL_BRAND:-legacy}

TL_BOOTSTRAP_OPTIONS=${TL_BOOTSTRAP_OPTIONS:--Dtlauncher.bootstrap.requireMinecraftAccount}

declare -a tlBootstrapOptions

IFS=" " read -r -a tlBootstrapOptions <<< "$TL_BOOTSTRAP_OPTIONS"
[ "$TL_IGNORE_SELF_UPDATE" = true ] && tlBootstrapOptions+=("-Dtlauncher.bootstrap.ignoreSelfUpdate")
tlBootstrapOptions+=("-Dtlauncher.bootstrap.brand=$TL_BRAND")

exec java "${tlBootstrapOptions[@]}" -jar /app/lib/tl/bootstrap.jar "$@"
