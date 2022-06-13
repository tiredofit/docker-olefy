FROM docker.io/tiredofit/alpine:3.16
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Disable Features from Base Image
ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/olefy" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-olefy/"

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
                   oletools \
                   python-magic \
                   && \
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
    rm -rf /root/.cargo && \
    rm -rf /var/cache/apk/*

### Networking Configuration
EXPOSE 1055

### Add Files
ADD install /
