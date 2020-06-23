FROM tiredofit/alpine:3.12
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

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
                libressl-dev \
                musl-dev \
                python3-dev \
                py-pip \
                && \
    \
    apk add -t .olefy-run-deps \
                libmagic \
                libressl \
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
     rm -rf /var/cache/apk/*

### Networking Configuration
EXPOSE 1055 

### Add Files
ADD install /
