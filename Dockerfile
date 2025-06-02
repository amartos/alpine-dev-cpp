FROM alpine:edge
ENV IMAGE_VERSION=20250602
ENV CMAKE_BUILD_PARALLEL_LEVEL=2
ENV CXX=ccache clang++
ENV CC=ccache clang
RUN apk -U upgrade
RUN <<EOR
    apk add \
        bash python3 perl git tar rsync zip gzip \
        build-base gcovr ccache \
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
