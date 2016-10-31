FROM ubuntu:16.04
MAINTAINER Fabian Fett "fabianfett@mac.com"

ENV SWIFT_BRANCH swift-3.0.1-GM-CANDIDATE 
ENV SWIFT_VERSION swift-3.0.1-GM-CANDIDATE 
ENV SWIFT_PLATFORM ubuntu16.04

# Install git
RUN apt-get update && \
    apt-get install -y \
      wget libcurl3 \
      clang make git \
      libicu55 libxml2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Swift keys
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

RUN SWIFT_ARCHIVE_NAME=$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

# Set Swift Path
ENV PATH /usr/bin:$PATH

# Copy Noze
COPY . /usr/src/noze

# Change workdir
WORKDIR /usr/src/noze/Samples/todo-mvc-redis

# Compile Sources
RUN swift build

# Run
ENV TODO_MVC_BACKEND in-memory

EXPOSE 1337
CMD [".build/debug/todo-mvc-redis"]