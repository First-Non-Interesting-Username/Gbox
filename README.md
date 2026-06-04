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
- Distrobox Ready - One-command setup with auto-exported apps and shared $HOME
- Game Exporting - Custom script for exporting games to host desktop 

## export-steam-game.sh usage



## Attribution

This project is a reimplementation of [Steambox](https://github.com/ublue-os/toolboxes/tree/main/toolboxes/steambox) from the ublue ecosystem.
I used parts of their code in my implementation and the art of writing workflows and container files is in my opinion a solved programming challange, so there are a lot of similiarities between our solutions.