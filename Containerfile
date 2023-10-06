ARG PCOIP_VERSION="${PCOIP_VERSION:-23.06.2}"
ARG UBUNTU_VERSION="${UBUNTU_VERSION:-22.04}"

FROM quay.io/toolbx-images/ubuntu-toolbox:${UBUNTU_VERSION}

COPY extra-packages /tmp/

RUN echo "install dependencies" && \
      apt-get update && apt-get upgrade -y && \
      cat /tmp/extra-packages | xargs apt-get install -y && \
    echo "done"

RUN echo "install pcoip-client" && \
      curl -1sLf https://dl.anyware.hp.com/DeAdBCiUYInHcSTy/pcoip-client/cfg/setup/bash.deb.sh | sudo -E distro=ubuntu codename=jammy bash && \
      apt-get update && \
      apt-get install -y pcoip-client=${PCOIP_VERSION}-${UBUNTU_VERSION} && \
    echo "done"

RUN echo "clean up" && \
      rm -rf /var/cache/apt /tmp && \
    echo "done"
