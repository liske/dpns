# Docker Pull & Save

## About

DPNS is a small script to pull a list of docker images and save them into a directory. Later those dumps can be loaded from disk into a local docker engine again.

This might help to sync images for offline docker hosts (w/o access to registries) or running [Alpine Linux](https://alpinelinux.org/) in diskless mode w/o adding the docker data directory (`/var/lib/docker`) to the [local backup](http://wiki.alpinelinux.org/wiki/Alpine_local_backup).

The following commands are provided:

- **dpns-load** - loads docker image dumps into dockerd
- **dpns-run** - loads docker image dumps and starts configured container stacks
- **dpns-save** - pulls docker image versions and dumps them to disk


## Install

There is a prebuild APK archive for *Alpine Linux*:

```
~ # wget https://github.com/liske/dpns/releases/download/0.2/dpns-0.2-r0.apk
Connecting to github.com (192.30.253.112:443)
Connecting to github-production-release-asset-2e65be.s3.amazonaws.com (52.216.66.40:443)
dpns-0.2-r0.apk      100% |*******************************|  3778   0:00:00 ETA
~ # apk add --allow-untrusted dpns-0.2-r0.apk
(1/16) Installing pkgconf (1.3.10-r0)
(2/16) Installing ncurses-terminfo-base (6.0_p20171125-r0)
(3/16) Installing ncurses-terminfo (6.0_p20171125-r0)
(4/16) Installing ncurses-libs (6.0_p20171125-r0)
(5/16) Installing readline (7.0.003-r0)
(6/16) Installing bash (4.4.12-r2)
Executing bash-4.4.12-r2.post-install
(7/16) Installing ca-certificates (20171114-r0)
(8/16) Installing libmnl (1.0.4-r0)
(9/16) Installing jansson (2.10-r0)
(10/16) Installing libnftnl-libs (1.0.8-r1)
(11/16) Installing iptables (1.6.1-r1)
(12/16) Installing device-mapper-libs (2.02.175-r0)
(13/16) Installing libltdl (2.4.6-r4)
(14/16) Installing libseccomp (2.3.2-r0)
(15/16) Installing docker (17.10.0-r0)
Executing docker-17.10.0-r0.pre-install
(16/16) Installing dpns (0.2-r0)
Executing busybox-1.27.2-r7.trigger
Executing ca-certificates-20171114-r0.trigger
OK: 115 MiB in 27 packages
```

Use `rc-update` to enable dpns to load docker images and run stacks on startup:

```
~ # rc-update add dpns
 * service dpns added to runlevel sysinit
```


## Configuration

The configuration files are located within of the `/etc/dpns` directory:

- **dpns.conf** - basic configuration
- **images.conf** - list of docker images
- **composes.conf** - list of docker compose files/directories started by `dpns-run`
