#!/bin/bash

[[ "${DEBUG}" == "true" ]] && set -x

set -u -o pipefail

DIR=$(dirname "${1}")

echo "Updating Plex - $DIR - ${DIR/\/var\/media/}"

case "$1" in
    */movies/* )
        ~/scripts/plex-scanner -s -r -c 1 -d "/data${DIR/\/var\/media/}"
    ;;
    */tv/* )
        ~/scripts/plex-scanner -s -r -c 2 -d "/data${DIR/\/var\/media/}"
    ;;
    */other/* )
        ~/scripts/plex-scanner -s -r -c 8 -d "/data${DIR/\/var\/media/}"
    ;;
    * ) echo "Error - no match";;
esac
