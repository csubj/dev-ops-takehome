FROM ubuntu:18.04
LABEL maintainer="ergatta-devs"
LABEL description="Dev env for Ergatta folk"

# install tools and deps
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get update --ignore-missing -yqq \
    && apt-get -q install --ignore-missing -y \
    libatomic1 \
    libxml2-dev \
    libedit2 \
    libsqlite3-0 \
    libc6-dev \
    binutils \
    libgcc-5-dev \
    libstdc++-5-dev \
    zlib1g-dev \
    libpython3.6 \
    tzdata \
    git \
    unzip \
    pkg-config \
    expect \
    make \
    openjdk-11-jdk \
    curl \
    wget \
    vim \
    openssh-client \
    locales \
    bsdtar \
    npm \
    && rm -r /var/lib/apt/lists/*

# Install Swift env https://github.com/apple/swift-docker/blob/main/5.7/ubuntu/18.04/Dockerfile
# ----------------------------------------------------------------
# Everything up to here should cache nicely between Swift versions, assuming dev dependencies change little

# pub   4096R/ED3D1561 2019-03-22 [SC] [expires: 2023-03-23]
#       Key fingerprint = A62A E125 BBBF BB96 A6E0  42EC 925C C1CC ED3D 1561
# uid                  Swift 5.x Release Signing Key <swift-infrastructure@swift.org
ARG SWIFT_SIGNING_KEY=A62AE125BBBFBB96A6E042EC925CC1CCED3D1561
ARG SWIFT_PLATFORM=ubuntu18.04
ARG SWIFT_BRANCH=swift-5.7.1-release
ARG SWIFT_VERSION=swift-5.7.1-RELEASE
ARG SWIFT_WEBROOT=https://download.swift.org

ENV SWIFT_SIGNING_KEY=$SWIFT_SIGNING_KEY \
    SWIFT_PLATFORM=$SWIFT_PLATFORM \
    SWIFT_BRANCH=$SWIFT_BRANCH \
    SWIFT_VERSION=$SWIFT_VERSION \
    SWIFT_WEBROOT=$SWIFT_WEBROOT

RUN set -e; \
    SWIFT_WEBDIR="$SWIFT_WEBROOT/$SWIFT_BRANCH/$(echo $SWIFT_PLATFORM | tr -d .)" \
    && SWIFT_BIN_URL="$SWIFT_WEBDIR/$SWIFT_VERSION/$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz" \
    && SWIFT_SIG_URL="$SWIFT_BIN_URL.sig" \
    # - Grab curl here so we cache better up above
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -q update && apt-get -q install -y curl && rm -rf /var/lib/apt/lists/* \
    # - Download the GPG keys, Swift toolchain, and toolchain signature, and verify.
    && export GNUPGHOME="$(mktemp -d)" \
    && curl -fsSL "$SWIFT_BIN_URL" -o swift.tar.gz "$SWIFT_SIG_URL" -o swift.tar.gz.sig \
    && gpg --batch --quiet --keyserver keyserver.ubuntu.com --recv-keys "$SWIFT_SIGNING_KEY" \
    && gpg --batch --verify swift.tar.gz.sig swift.tar.gz \
    # - Unpack the toolchain, set libs permissions, and clean up.
    && tar -xzf swift.tar.gz --directory / --strip-components=1 \
    && chmod -R o+r /usr/lib/swift \
    && rm -rf "$GNUPGHOME" swift.tar.gz.sig swift.tar.gz 

# Install Android SDK https://github.com/mindrunner/docker-android-sdk/blob/master/ubuntu/standalone/Dockerfile
# ----------------------------------------------------------------
ENV ANDROID_SDK_HOME=/opt/android-sdk-linux \
    ANDROID_SDK_ROOT=/opt/android-sdk-linux \
    ANDROID_HOME=/opt/android-sdk-linux \
    ANDROID_SDK=/opt/android-sdk-linux \
    LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android -u 1000 android

COPY tools /opt/tools
COPY licenses /opt/licenses
WORKDIR /opt/android-sdk-linux
RUN /opt/tools/entrypoint.sh built-in

# Install Bazel
# ----------------------------------------------------------------

RUN npm install -g @bazel/bazelisk

# Cleanup 
RUN apt-get clean
RUN apt-get purge --auto-remove -y curl