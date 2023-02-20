# pcoip-x

[![build-pcoip-bx](https://github.com/fossrob/pcoip-bx/actions/workflows/build.yml/badge.svg)](https://github.com/fossrob/pcoip-bx/actions/workflows/build.yml)

This is a prebuilt Ubuntu LTS image for [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/) and [Distrobox](https://distrobox.privatedns.org/), with the [HP Anyware Software Client](https://docs.teradici.com/find/product/hp-anyware/2023.01/software-client-for-linux) pre-installed.

- The image is built based off the [Ubuntu 22.04 Toolbx Community Image](https://github.com/toolbx-images/images)

## usage (with distrobox)

Create the distrobox:

```bash
distrobox create --pull --image create --image ghcr.io/fossrob/pcoip-bx:latest --name pcoip-bx
```

Enter the distrobox:

```bash
distrobox enter pcoip-bx
```

Export the pcoip-client application:

```bash
distrobox-export --app pcoip-client
```

You should now have an application in your desktop applications list called `PCoIP Client (on pcoip-bx)`.

## acknowledgements

[Jorge Castro](https://github.com/castrojo), his work on [ublue-os][https://github.com/ublue-os] and specifically [boxkit](https://github.com/ublue-os/boxkit).
