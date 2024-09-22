FROM alpine:edge
ENV IMAGE_VERSION=20240922
RUN apk -U upgrade
RUN <<EOR
    apk add \
        bash git tar rsync zip gzip \
        build-base cmake gcovr \
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
USER git
WORKDIR /home/git
CMD [ "/bin/bash" ]
