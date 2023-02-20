FROM quay.io/toolbx-images/alpine-toolbox:3.17

COPY extra-packages /

RUN echo "package installs" && \
      apk update && \
      apk upgrade && \
      cat /extra-packages | xargs apk add && \
    echo "done"

RUN echo "clean up" && \
      rm /extra-packages && \
    echo "done"

RUN echo "host symlinks" && \
      ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update && \
    echo "done"
