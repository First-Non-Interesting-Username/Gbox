#!/usr/bin/env bash

PRISM_DIR="$HOME/.local/share/PrismLauncher/instances"

mkdir -p "$PRISM_DIR"

if [ ! -d "$PRISM_DIR/create-just-for-fun" ]; then
    cp -r /opt/prism-template/instances/create-just-for-fun "$PRISM_DIR/"
fi