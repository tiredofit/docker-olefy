ARG DISTRO=alpine
ARG DISTRO_VARIANT=3.19

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV OLEFY_VERSION=f8aac6cc55283886d153e89c8f27fae66b1c24e2 \
    OLEFY_REPO_URL=https://github.com/HeinleinSupport/olefy \
    CONTAINER_ENABLE_MESSAGING=FALSE \
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
                py3-async_generator \
                py3-magic \
                py3-oletools \
                && \
    \
    clone_git_repo ${OLEFY_REPO_URL} ${OLEFY_VERSION} && \
    cp /usr/src/olefy/olefy.py /usr/local/bin && \
    chmod +x /usr/local/bin/olefy.py && \
    \
    package remove olefy-build-deps && \
    rm -rf /usr/src/* \
           /root/.cache \
           /root/.cargo

EXPOSE 1055

COPY install /
