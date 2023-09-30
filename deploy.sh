#!/bin/bash

DRY_RUN=""

usage () {
    echo "Usage: $0 [-h | --help] [-n | --dry-run]" 1>&2
    exit 1
}

main () {
    source .env

    $BUILD_CMD

    chmod -R +x $SRC_DIR
    rsync -rvzp $DRY_RUN --delete --progress $SRC_DIR $USER@$HOST:$TARGET_DIR
}

for arg in "$@"
do
    shift
    case "$arg" in
        -h | --help ) usage ;;
        -n | --dry-run ) DRY_RUN="-n"; main ;;
        -p | --push ) main ;;
        * ) usage ;;
    esac
done
