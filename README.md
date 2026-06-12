> [!IMPORTANT]
> Parts of this project are licensed under Apache 2.0, as explained in [Notice](./NOTICE)

# Gbox

Personal Gaming distroBOX OCI image.

## Quick start

> [!NOTE]
> This project targets AMD GPUs. GPUs from other vendors aren't supported, but may work with tinkering.
> You may have bad experience with DEs other than GNOME and Plasma.

Make sure [distrobox](https://distrobox.it/) with dependencies is installed on your system.
To assemble the distrobox with reccommended settings run the follwing command:

```bash
# For Plasma
distrobox-assemble create --file https://raw.githubusercontent.com/First-Non-Interesting-Username/Gbox/main/distrobox/plasma.ini
# For GNOME
distrobox-assemble create --file https://raw.githubusercontent.com/First-Non-Interesting-Username/Gbox/main/distrobox/gnome.ini
```

You can create the container manually, using `distrobox-create` command or with visual tools such as [distroshelf](https://flathub.org/en/apps/com.ranfdev.DistroShelf).

Using the distrobox assemble file is the only supported option, I reserve the right to not provide support if it has been installed with another method. 

## Description

Gbox is a personal Arch based OCI image designed for gaming. It is heavily inspired by Steambox from the ublue ecosystem, but it improves upon the original, while keeping core features. 

## Usage instructions

Important commands (on host):
```bash
# Enter the container
distrobox enter gbox
# Update packages
distrobox upgrade gbox
```

and in the container:
```bash
# Export an app
distrobox-export --app steam
# Unexport an app
distrobox-export --delete --app steam
```

By default `$HOME` is shared with host.

For further informations refer to [distrobox docs](https://distrobox.it/).

## Features

- AMD GPU Optimized - Vulkan drivers, VA-API, and 32-bit Steam/Proton libraries
- Pre-installed Gaming Apps - Steam, Lutris, Heroic, Prism Launcher, SteamCMD
- Desktop Variants - Separate KDE Plasma and GNOME images with portal integration
- Distrobox Ready - One-command setup with auto-exported apps and shared `$HOME`
- Game Exporting - Custom script for exporting games to host desktop
- Minecraf Modpack - Prism Launcher preloaded with [Create: Just For Fun](https://modrinth.com/project/Oz2C6Bff) Minecraft modpack

## FAQ

**Q: Why use a Distrobox container for gaming instead of installing on my host OS?**
**A:** To keep your host clean from the imperative mess which gaming is.

**Q: Why Gbox over Steambox?**
**A:** Gbox offers better support, more features and less bloat than Steambox. 

**Q: Will this project be abandoned?**
**A:** I hope not, I'm a user of it myself.

## export-steam-game.sh usage

This script makes it easy to generate `.desktop` entries for games installed in the container.
It only works with steam games, but I plan to implement it for other launchers.

```bash
# Flags:
# --home: Location of container's $HOME.
# --ID: Game ID from steam (480 = Spacewar).
# --container-name: Name of the distrobox container.
# --delete-entries: Wipes previously created desktop entries.

curl -fSSL https://raw.githubusercontent.com/First-Non-Interesting-Username/Gbox/main/export-steam-game.sh | bash -s -- \
  --home "$HOME" \
  --ID 480 \
  --container-name gbox \
  --delete-entries
```

## Attribution

This project is a reimplementation of [Steambox](https://github.com/ublue-os/toolboxes/tree/main/toolboxes/steambox) from the ublue ecosystem.

## License

This project is licensed under the GNU General Public License v3.0 or later.
See the [LICENSE](LICENSE) file for details.