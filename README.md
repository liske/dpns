# Docker Pull & Save

## About

DPNS is a small script to pull a list of docker images and save them into a directory. Later those dumps can be loaded from disk into a local docker engine again.

This might help to sync images for offline docker hosts (w/o access to registries) or running [Alpine Linux](https://alpinelinux.org/) in diskless mode w/o adding the docker data directory (`/var/lib/docker`) to the [local backup](http://wiki.alpinelinux.org/wiki/Alpine_local_backup).

The following commands are provided:

- **dpns-load** - loads docker image dumps into dockerd
- **dpns-run** - loads docker image dumps and starts configured container stacks
  using *docker-compose*
- **dpns-save** - pulls docker image versions and dumps them to disk and removes
  obsolete image dumps


## Install on Alpine Linux

It is [available](https://pkgs.alpinelinux.org/packages?name=dpns) in the *testing* repository of the *edge* branch:

```
~ # apk add dpns
```

Use `rc-update` to enable dpns to load docker images and run stacks on startup:

```
~ # rc-update add dpns
 * service dpns added to runlevel sysinit
```


## Configuration

The configuration files are located within of the `/etc/dpns` directory:

- **dpns.conf** - base configuration
- **images.conf** - list of docker images to save and load
- **composes.conf** - list of docker compose files/directories started by `dpns-run`
