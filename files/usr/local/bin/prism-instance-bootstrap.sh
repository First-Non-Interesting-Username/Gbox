#!/usr/bin/env bash

PRISM_DIR="$HOME/.local/share/PrismLauncher"

mkdir -p "$PRISM_DIR"

if [ ! -d "$PRISM_DIR/instances/create-just-for-fun" ]; then
    cp -r /opt/PrismLauncher/* "$PRISM_DIR/"
fi