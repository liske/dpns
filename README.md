# docker pull & save

DPNS is a small script to pull a list of docker images and save them into a directory. Later those dumps can be loaded from disk into a local docker engine again.

This might help to sync images for offline docker hosts (w/o access to registries) or running [Alpine Linux](https://alpinelinux.org/) in diskless mode w/o adding the docker data directory (`/var/lib/docker`) to the [local backup](http://wiki.alpinelinux.org/wiki/Alpine_local_backup).

The following commands are provided:

- **dpns-load** - loads docker image dumps into dockerd
- **dpns-run** - loads docker image dumps and starts configured container stacks
- **dpns-save** - pulls latest docker image versions and dumps them to disk
