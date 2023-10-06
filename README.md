# pcoip-bx

[![build-pcoip-bx](https://github.com/fossrob/pcoip-bx/actions/workflows/build.yml/badge.svg)](https://github.com/fossrob/pcoip-bx/actions/workflows/build.yml)

These are prebuilt Ubuntu LTS images for use with [toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/) and [distrobox](https://distrobox.it/), with the [HP Anyware Software Client](https://docs.teradici.com/find/product/software-and-mobile-clients) pre-installed.

- The images are based off the [Ubuntu Toolbx Community Images](https://github.com/toolbx-images/images)

## pre-requisites

- A properly configured installation of [podman](https://podman.io/) **(strongly preferred)** or [docker](https://www.docker.com/) ([install](https://docs.docker.com/engine/install/), [post-install](https://docs.docker.com/engine/install/linux-postinstall/))
- A working (and updated) installation of [distrobox](https://distrobox.it/), see: [distrobox supported container images](https://distrobox.it/compatibility/#supported-container-managers)

## version matrix

| ubuntu | pcoip   | status             | default |
| -------| --------| ------------------ | ------- |
| 22.04  | 23.08.1 | ❌ fails to launch |         |
| 22.04  | 23.06.2 | ✅ working         | ⭐️      |
| 20.04  | 23.08.1 | ❌ fails to launch |         |
| 20.04  | 23.06.2 | ✅ working         |         |

⭐️ _This version will be installed if you use_ `pcoip-bx:latest` _as the tag._

## usage (with distrobox)

Create the distrobox:

```bash
distrobox create --pull --image ghcr.io/fossrob/pcoip-bx:latest --name pcoip-bx
```

Or with custom home:

```bash
mkdir -p ~/distroboxes
distrobox create --pull --image ghcr.io/fossrob/pcoip-bx:latest --name pcoip-bx --home ~/distroboxes/pcoip-bx
```

Export the pcoip-client application from the distrobox:

```bash
distrobox enter pcoip-bx -- distrobox export --app pcoip-client
```

After a few seconds you should now have an application in your desktop applications list called `PCoIP Client (on pcoip-bx)`.

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
