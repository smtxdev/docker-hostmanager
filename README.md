# Docker Hostmanager

## Supported platforms/environments

- Docker Toolbox (Mac and Windows)
- Docker Desktop for Windows
- Docker Desktop for Mac
- Docker CE (Linux)

## Installation

Make sure you have `docker` installed on your system. See this [guide](https://github.com/smtxdev/wiki/blob/master/setup-docker.md) how to install `docker` on your system.
That guide describes as well how to setup docker that it get's access to `c:/Windows/System32/drivers/etc/hosts` or on mac `/etc/hosts`.

## Usage without docker-compose

```
docker run -v /:/host/ hostmanager-dummy --hostnames abc.de
```

## Usage with docker-compose


```yaml
  hostmanager:
    build: images/hostmanager
    restart: "no"
        environment:
          HOSTMANAGER_HOSTNAMES: "example.de"
    volumes:
      - /:/host/
```

If you already have an `.env` file next to your `docker-compose.yml` then you can do this as well:

```yaml
  hostmanager:
    build: images/hostmanager
    restart: "no"
    volumes:
      - ${HOSTMACHINE_MAIN_DRIVE_ROOT}:/host/
      - ./.env:/.env
```

In your `.env` file:

```
HOSTMANAGER_HOSTNAMES: "example.de"

# Use for Windows = /c/ and for Mac/Linux = /
HOSTMACHINE_MAIN_DRIVE_ROOT=/
```

As you can see we mount the `.env` file into the container then we don't need to set them in the `docker-compose.yml`.

## Parameters (environment variables)

All parameters of https://github.com/smtxdev/hostmanager can be passed as env-vars into the container.

See for all parameters:

```
docker run -v /:/host/ hostmanager-dummy --help
```
