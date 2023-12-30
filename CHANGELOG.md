## 1.3.0 2023-12-30 <dave at tiredofit dot ca>

   ### Added
      - Use alpine packages for python dependencies
      - Pin to olefy f8aac6cc55283886d153e89c8f27fae66b1c24e2 to fix indentation error


## 1.2.2 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Break system packages with python


## 1.2.1 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Change base image to tiredofit/alpine:3.19


## 1.2.0 2023-05-10 <dave at tiredofit dot ca>

   ### Added
      - Modernize Dockerfile
      - Alpine 3.18 base


## 1.1.11 2022-11-23 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.17 base


## 1.1.10 2022-08-17 <dave at tiredofit dot ca>

   ### Changed
      - Switch to using exec to launch process


## 1.1.9 2022-06-15 <dave at tiredofit dot ca>

   ### Changed
      - Change path to where /usr/bin/olevba resides


## 1.1.8 2022-06-13 <dave at tiredofit dot ca>

   ### Changed
      - Stop using patched oletools as the original olefy repo is not using it anymore


## 1.1.7 2022-05-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.16 base


## 1.1.6 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Rework to support new base image


## 1.1.5 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Update base image


## 1.1.4 2021-12-15 <dave at tiredofit dot ca>

   ### Added
      - Add auto register support for Zabbix Agent/monitoring


## 1.1.3 2021-11-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.15 base


## 1.1.2 2021-09-04 <dave at tiredofit dot ca>

   ### Changed
      - Change the way that log rotation is configured for future log parsing


## 1.1.1 2021-07-29 <dave at tiredofit dot ca>

   ### Changed
      - Remove rust build cache


## 1.1.0 2021-07-29 <dave at tiredofit dot ca>

   ### Added
      - Switch to HeinleinSupport/oletools fork to be more compatible with RSPAMD
      - Quiet down Olefy and force output to logs


## 1.0.5 2021-06-17 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.14 Base


## 1.0.4 2021-01-14 <dave at tiredofit dot ca>

   ### Changed
      - Alpine 3.13 Base         


## 1.0.3 2020-09-13 <dave at tiredofit dot ca>

   ### Added
      - Add python3-setuptools


## 1.0.2 2020-09-13 <dave at tiredofit dot ca>

   ### Changed
      - Cleanup Code


## 1.0.1 2020-06-23 <dave at tiredofit dot ca>

   ### Changed
      - Remove cache directory after installation


## 1.0.0 2020-06-23 <dave at tiredofit dot ca>

   ### Added
      - Initial Release
      - Alpine 3.1.2
