#!/usr/bin/env bash
set -e
source /usr/local/hostmanager/bashrc.sh
exec /usr/local/hostmanager/vendor/bin/hostmanager "$@"
