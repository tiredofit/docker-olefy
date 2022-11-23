# github.com/tiredofit/docker-olefy

[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/olefy.svg)](https://hub.docker.com/r/tiredofit/olefy)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/olefy.svg)](https://hub.docker.com/r/tiredofit/olefy)

## About

Dockerfile to build an [Olefy](https://github.com/HeinleinSupport/olefy) container image for utilizing OLE Tools over a network socket.

* This Container uses a [customized Alpine Linux base](https://hub.docker.com/r/tiredofit/alpine) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, nano, vim) for easier management. It also supports sending to external SMTP servers..



[Changelog](CHANGELOG.md)

## Maintainer

- [Dave Conroy](https://github.com/tiredofit/)

## Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

## Prerequisites and Assumptions

This image doesn't do much on it's own - You'd probably want to use a [rSpamd](https://hub.docker.com/r/tiredofit/rspamd) to utilize it.

## Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/olefy) and is the recommended method of installation.


```bash
docker pull tiredofit/olefy:(imagetag)
```

The following image tags are available:
* `latest` - Most recent release of olefy w/ Alpine Linux

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.


## Configuration

### Persistent Storage

No files are required for persistent storage.

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), below is the complete list of available options that can be used to customize your installation.

| Parameter | Description | 
|-----------|-------------|
| `LISTEN_IP` | Listening IP - Default `127.0.0.1` |
| `LISTEN_PORT` | Listening Port - Default `1055` |
| `TMP_PATH` | Temporary Files Path - Default `/tmp/olefy/` |
| `LOG_LEVEL` | `DEBUG` `INFO` `WARNING` `ERROR` `CRITICAL` - Default `INFO` |
| `MINIMUM_CHARACTER_LENGTH` | Ignore files under this character amount - Default `500` |
| `DELETE_TEMP_FILES` | Delete temporary files - Default `TRUE` |
| `DELETE_TEMP_FILES_FAILED` | Delete failed temporary files - Default `TRUE` |

### Networking

| Port | Description |
|-----------|-------------|
| `1055` | Listening Port |

## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. olefy-app) bash
```

## References

* https://github.com/HeinleinSupport/olefy
