FROM ubuntu:18.04 as build

# Download and checkout cascade
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ca-certificates \
    build-essential \
    ccache \
    flex \
    libfl-dev \
    bison \
    libncurses-dev \
    && git clone --recursive https://github.com/vmware/cascade /cascade

# Build cascade, using as many processors as available
RUN cd /cascade && make -j$(getconf _NPROCESSORS_ONLN)

