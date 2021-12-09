# Changelog

## 1.0.0

* Ubuntu 20.04 base image.
* Set the default shell to `/bin/bash` for `Dockerfile` comamnds.
* Set `DEBIAN_FRONTEND` to `noninteractive`.
* Set `TERM` to `xterm`.
* Set `WORKDIR` to `/`.
* Set `CMD` to `/bin/bash`.
* Add Nginx `1.20.2`.
* Add Nginx custom configuration:
  * `http.conf`
  * `log.conf`
  * `main.conf`
  * `mime.types`
  * `nginx.conf`
  * `robots.txt`
* Add Wallarm `3.4.1-1`.
* Add required system packages:
  * `ca-certificates`
  * `dirmngr`
  * `gnupg2`
  * `wget`
