ARG DISTRO=alpine
ARG DISTRO_VARIANT=3.19

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/olefy" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-olefy/"

RUN source /assets/functions/00-container && \
    set -x && \
    package update && \
    package upgrade && \
    package install .olefy-build-deps \
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
    package install .olefy-run-deps \
                libmagic \
                openssl \
                python3 \
                && \
    \
    pip install --break-system-packages --upgrade \
                   asyncio \
                   oletools \
                   python-magic \
                   && \
    \
    clone_git_repo https://github.com/HeinleinSupport/olefy && \
    cp /usr/src/olefy/olefy.py /usr/local/bin && \
    chmod +x /usr/local/bin/olefy.py && \
    \
    package remove olefy-build-deps && \
    rm -rf /usr/src/* \
           /root/.cache \
           /root/.cargo

EXPOSE 1055

COPY install /
