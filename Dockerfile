FROM tiredofit/alpine:3.14
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Disable Features from Base Image
ENV ENABLE_SMTP=FALSE

### Install Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .olefy-build-deps \
                gcc \
                git \
                libffi-dev \
                musl-dev \
                openssl-dev \
                python3-dev \
                py-pip \
                && \
    \
    apk add -t .olefy-run-deps \
                libmagic \
                openssl \
                python3 \
                py3-setuptools \
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
    rm -rf /var/cache/apk/*

### Networking Configuration
EXPOSE 1055

### Add Files
ADD install /
