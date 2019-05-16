#!/usr/bin/env bash

if [ -f "/.env" ]; then
    set -o allexport; source /.env; set +o allexport;
fi

if [ -z "$HOSTMANAGER_IP" ]; then
    if ping -q -c 1 -W 1 192.168.99.100 >/dev/null; then
        export HOSTMANAGER_IP=192.168.99.100
    else
        export HOSTMANAGER_IP=127.0.0.1
    fi
fi

if [ -z "$HOSTMANAGER_SCOPE" -a  ! -z "$COMPOSE_PROJECT_NAME" ]; then
    export HOSTMANAGER_SCOPE=${COMPOSE_PROJECT_NAME}
fi

if [ -z "$HOSTMANAGER_HOSTSFILE" ]; then
    export HOSTMANAGER_HOSTSFILE="/host/Windows/System32/drivers/etc/hosts,/host/private/etc/hosts,/host/etc/hosts"
fi
