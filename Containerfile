FROM quay.io/toolbx-images/ubuntu-toolbox:22.04

COPY extra-packages /

RUN echo "package installs" && \
      apt-get update && \
      apt-get upgrade -y && \
      cat /extra-packages | xargs apt-get install -y && \
    echo "done"

RUN echo "install pcoip-client" && \
      curl -1sLf https://dl.teradici.com/DeAdBCiUYInHcSTy/pcoip-client/cfg/setup/bash.deb.sh | sudo -E distro=ubuntu codename=jammy bash && \
      apt-get update && \
      apt-get install -y pcoip-client && \
    echo "done"

RUN echo "clean up" && \
      rm /extra-packages && \
    echo "done"
