ARG UBUNTU_VERSION=22.04
ARG PCOIP_VERSION=23.06.2

FROM quay.io/toolbx-images/ubuntu-toolbox:${UBUNTU_VERSION}

# ARGS go out of scope for new build stage so need redefining (default values persist however)
ARG PCOIP_VERSION
ARG UBUNTU_VERSION

COPY extra-packages /tmp/

RUN echo "install dependencies" && \
      apt-get --quiet update  && apt-get --quiet upgrade -y && \
      cat /tmp/extra-packages | xargs apt-get --quiet install -y && \
    echo "done"

RUN echo "install pcoip-client" && \
      curl -1sLf https://dl.anyware.hp.com/DeAdBCiUYInHcSTy/pcoip-client/cfg/setup/bash.deb.sh | sudo -E distro=ubuntu version=${UBUNTU_VERSION} bash && \
      apt-get --quiet update  && \
      apt-get --quiet install -y pcoip-client=${PCOIP_VERSION}-${UBUNTU_VERSION} && \
    echo "done"

RUN echo "clean up" && \
      rm -rf /var/cache/apt /tmp && \
    echo "done"
