# Docker Hostmanager

Updates automatically your hosts file (Mac / Linux: `/etc/hosts` - Windows: `c:/Windows/System32/drivers/etc/hosts`) for example for local development.

This Hostmanager works a bit different than existing docker Hostmanagers. This Hostmanager does **not** check running containers and tries to find their hostnames.
Rather you just tell this Hostmanager directly in the `docker-run-command`  or in the `.env` file or in the `docker-compose.yml` file which hosts you need.

Dockerized version of https://github.com/smtxdev/hostmanager.


## Supported platforms/environments

- Docker Toolbox (Mac and Windows)
- Docker Desktop for Windows
- Docker Desktop for Mac
- Docker CE (Linux)

## Installation

Make sure you have `docker` installed on your system. See this [guide](https://github.com/smtxdev/wiki/blob/master/setup-docker.md) how to install `docker` on your system.
That guide describes as well how to setup docker that it get's access to `c:/Windows/System32/drivers/etc/hosts` and `/etc/hosts`.

Here very brief the needed steps. See that guide above for more details:

- Install docker
- Mac/Linux: `chmod 666 /etc/hosts` - Windows: Right click on `c:/Windows/System32/drivers/etc/hosts` and set the file permissions of your current user to full-access. Or in powershell: `icacls "c:/Windows/System32/drivers/etc/hosts" /grant Users:F` that gives all users on the computer write access to that file.
- Docker-Toolbox: Add the following shared folders `/etc` (Mac/Linux) and `c:/Windows` (Windows) in Virtualbox.

## Usage via docker run

```
docker run -v /:/host/ smtxdev/hostmanager --hostnames example1.de,example2.de
```

## Usage via docker-compose


```yaml
  hostmanager:
    image: smtxdev/hostmanager
    restart: "no"
    environment:
      HOSTMANAGER_HOSTNAMES: "example1.de,example2.de"
    volumes:
      - /:/host/
```

If you already have an `.env` file next to your `docker-compose.yml` then you can do this as well:

```yaml
  hostmanager:
    image: smtxdev/hostmanager
    restart: "no"
    volumes:
      - ${HOSTMACHINE_MAIN_DRIVE_ROOT}:/host/
      - ./.env:/.env
```

In your `.env` file:

```
HOSTMANAGER_HOSTNAMES: "example1.de,example2.de"

# Use for Windows = /c/ and for Mac/Linux = /
HOSTMACHINE_MAIN_DRIVE_ROOT=/
```

As you can see we mount the `.env` file into the container then we don't need to set the env-vars in the `docker-compose.yml`.

## Parameters (environment variables)

All parameters of https://github.com/smtxdev/hostmanager can be passed to the `docker-run-command`. Alternatively you can set all parameters as env-vars in your `.env` file or `docker-compose.yml` file.

See for all parameters:

```
docker run smtxdev/hostmanager --help
```
