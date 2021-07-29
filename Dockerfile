FROM tiredofit/alpine:3.14
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Disable Features from Base Image
ENV CONTAINER_ENABLE_MESSAGING=FALSE

### Install Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .olefy-build-deps \
                cargo \
                gcc \
                git \
                libffi-dev \
                musl-dev \
                openssl-dev \
                python3-dev \
                py-pip \
                py3-wheel \
                py3-setuptools \
                && \
    \
    apk add -t .olefy-run-deps \
                libmagic \
                openssl \
                python3 \
                && \
    \
    pip install --upgrade \
                   asyncio \
                   #oletools \
                   python-magic \
                   && \
    \
    ## Fetch Patched OLETools
    pip3 install https://github.com/HeinleinSupport/oletools/archive/master.zip && \
    \
    ## Fetch Olefy
    git clone https://github.com/HeinleinSupport/olefy /usr/src/olefy && \
    cp /usr/src/olefy/olefy.py /usr/local/bin && \
    chmod +x /usr/local/bin/olefy.py && \
    \
    ## Cleanup
    apk del .olefy-build-deps && \
    rm -rf /usr/src/* && \
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/*

### Networking Configuration
EXPOSE 1055

### Add Files
ADD install /
