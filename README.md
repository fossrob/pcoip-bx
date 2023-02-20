# pcoip-bx

[![build-pcoip-bx](https://github.com/fossrob/pcoip-bx/actions/workflows/build.yml/badge.svg)](https://github.com/fossrob/pcoip-bx/actions/workflows/build.yml)

This is a prebuilt Ubuntu LTS image for [toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/) and [distrobox](https://distrobox.privatedns.org/), with the [HP Anyware Software Client](https://docs.teradici.com/find/product/hp-anyware/2023.01/software-client-for-linux) pre-installed.

- The image is built based off the [Ubuntu 22.04 Toolbx Community Image](https://github.com/toolbx-images/images)

## pre-requisites

- a properly configured installation of [podman](https://podman.io/) **(preferred)** or [docker](https://www.docker.com/) ([install](https://docs.docker.com/engine/install/), [post-install](https://docs.docker.com/engine/install/linux-postinstall/))
- a working (and updated) installation of [distrobox](https://distrobox.privatedns.org/), see: [distrobox supported container images](https://distrobox.privatedns.org/compatibility.html#supported-container-managers)

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

### running manually

You can execute the application from the commandline with:

```bash
distrobox enter pcoip-bx -- pcoip-client
```

### updating

The image builds on a weekly schedule, but after deploying can be updated by distrobox itself.

Outside of the distrobox (i.e. on the "host"):

```bash
distrobox upgrade pcoip-bx
```

## acknowledgements

- [Jorge Castro](https://github.com/castrojo), his work on [ublue-os](https://github.com/ublue-os) and specifically [boxkit](https://github.com/ublue-os/boxkit).
- [Luca Di Maio](https://github.com/89luca89), for the incredible work creating [distrobox](https://github.com/89luca89/distrobox).
