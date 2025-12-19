FROM ubuntu:22.04
ARG NODE_VERSION=20
ARG NVM_VERSION=0.40.3

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt-get update && apt-get -y install libwebkit2gtk-4.1-dev \
        build-essential \
        curl \
        wget \
        file \
        libxdo-dev \
        libssl-dev \
        libayatana-appindicator3-dev \
        librsvg2-dev \
        xdg-utils \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash

ENV NVM_DIR=/root/.nvm

RUN \
    source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && . "$HOME/.cargo/env" \
    && cargo install tauri-cli --version "^2.0.0" --locked

WORKDIR /src

ENTRYPOINT ["bash", "-c", "source $NVM_DIR/nvm.sh && exec \"$@\"", "--"]

# set cmd to bash
CMD ["/bin/bash"]