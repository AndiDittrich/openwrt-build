FROM debian:9.6

# system base packages + build dependencies + user setup ~350MB
RUN set -xe \
    && apt-get update \
    && apt-get install -y --no-install-recommends \ 
        nano bash ca-certificates openssh-client \
        subversion g++ zlib1g-dev build-essential git python \
        rsync libncurses5-dev gawk gettext unzip file libssl-dev wget zip time \
    && rm -rf /var/lib/apt/lists/* \
    && useradd build \
    && mkdir /home/build \
    && chown build:build /home/build

# run as build user
USER build

# clone openwrt repo ~200MB
RUN set -xe \
    && cd /home/build \
    && git clone https://git.openwrt.org/openwrt/openwrt.git openwrt

# checkout v18.06.1 stable
ARG GIT_REVISION=v18.06.1

# fetch branch/tag and update feeds ~100MB
RUN set -xe \
    && cd /home/build/openwrt \
    && git checkout ${GIT_REVISION} \
    && ./scripts/feeds update -a \
    && ./scripts/feeds install -a

# copy related configs
COPY conf /home/build/conf

# working dir
WORKDIR /home/build/openwrt

# start bash
ENTRYPOINT [ "/bin/bash" ]