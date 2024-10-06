FROM alpine:edge
ENV IMAGE_VERSION=20240928
ENV CMAKE_BUILD_PARALLEL_LEVEL=2
RUN apk -U upgrade
RUN <<EOR
    apk add \
        bash git tar rsync zip gzip \
        build-base gcovr \
        cmake make \
        meson ninja-build pkgconf py3-pkgconfig \
        doxygen graphviz plantuml \
        clang clang-extra-tools clang-analyzer compiler-rt \
        llvm llvm-dev llvm-gtest llvm-linker-tools \
        llvm-static llvm-test-utils \
        boost boost-dev \
        benchmark benchmark-dev \
        zlib-dev zstd-dev \
        curl-dev openssl-dev \
        libedit libedit-dev \
        libxml2 libxml2-dev \
        nodejs npm openssl
EOR
RUN passwd -d -l root
RUN adduser -D -s /bin/bash git
WORKDIR /home/git
CMD [ "/bin/bash" ]
