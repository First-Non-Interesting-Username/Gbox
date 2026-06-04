#!/usr/bin/env bash
set -euo pipefail

# We assume the user didn't set a custom HOME for the container, what I'm planning to do
# Genius design
HOME_DIR=$HOME
ID=""
CONTAINER_NAME="gbox"

TARGET_DIR="$HOME/.local/share/applications"
DELETE_ENTRIES=false

echo "Everything is going fine"

# Some random logic, which I don't really understand
while [[ $# -gt 0 ]]; do
  case "$1" in
    --home)
      HOME_DIR="$2"
      shift 2
      ;;
    --ID)
      ID="$2"
      shift 2
      ;;
    --container-name)
      CONTAINER_NAME="$2"
      shift 2
      ;;
    --delete-entries)
      DELETE_ENTRIES=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# If flag --delete-entries is passed, delete all entries containing "*-*-iam-stupid-and-cant-code-deletion-logic.desktop" in file name and end the script
if $DELETE_ENTRIES; then
  deleted_count=0
  # I am stupid
  shopt -s nullglob
  for file in "$TARGET_DIR"/*-*-iam-stupid-and-cant-code-deletion-logic.desktop; do
    if [[ -f "$file" ]]; then
      rm "$file"
      deleted_count=$((deleted_count + 1))
    fi
  done
  echo "Deleted $deleted_count desktop entries."
  exit 0
fi


if [[ -z "$HOME_DIR" || -z "$ID" || -z "$CONTAINER_NAME" ]]; then
  echo "Usage: $0 --home <path> --ID <id> --container-name <name>"
  exit 1
fi

if ! [[ "$ID" =~ ^[0-9]+$ ]]; then
  echo "Error: ID isn't valid"
  exit 1
fi

MANIFEST="$HOME_DIR/.steam/steam/steamapps/appmanifest_$ID.acf"

if [[ ! -f "$MANIFEST" ]]; then
    echo "Error: Game $ID is NOT installed." >&2
    exit 1
fi

# It works, until it doesn't
ICON_URL="https://steamcdn-a.akamaihd.net/steam/apps/$ID/library_600x900_2x.jpg"
ICON_PATH="/Pictures/$ID.jpg"

echo "Downloading icon for game $ID"
curl --create-dirs -L -o "$HOME_DIR""$ICON_PATH" "$ICON_URL"

GAME_NAME=$(grep -m1 -oP '"name"\s+"\K[^"]+' "$MANIFEST" || true)
if [[ -z "$GAME_NAME" ]]; then
    echo "Error: Could not read game name from manifest." >&2
    exit 1
fi

HOST_ICON_PATH="$HOME_DIR""$ICON_PATH"

mkdir -p "$TARGET_DIR"

# OMG, I'm really stupid
FILE_NAME="$ID"-"$CONTAINER_NAME"-iam-stupid-and-cant-code-deletion-logic.desktop
DESKTOP_ENTRY_NAME="$TARGET_DIR"/"$FILE_NAME"

echo "Creating the desktop entry"
cat << EOF > "$DESKTOP_ENTRY_NAME"
[Desktop Entry]
Type=Application
Version=1.0
Name=$GAME_NAME
Exec=distrobox enter $CONTAINER_NAME -- steam steam://run/$ID
Icon=$HOST_ICON_PATH
Terminal=false
Categories=Game
EOF

distrobox enter "$CONTAINER_NAME" -- chmod +x "$DESKTOP_ENTRY_NAME"

echo "Desktop entry created, available in $DESKTOP_ENTRY_NAME for edits"