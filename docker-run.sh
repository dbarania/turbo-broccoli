#!/bin/bash

IMAGE="hugomods/hugo:debian"
SRC_DIR="${PWD}"
CACHE_DIR="${HOME}/hugo_cache"
PORT="1313"

mkdir -p "${CACHE_DIR}"

USER_ID=$(id -u)
GROUP_ID=$(id -g)

if [ $# -eq 0 ]; then
  docker run -it \
    -v "${SRC_DIR}:/src" \
    -v "${CACHE_DIR}:/tmp/hugo_cache" \
    -p "${PORT}:${PORT}" \
    -w /src \
    --user "${USER_ID}:${GROUP_ID}" \
    "${IMAGE}" /bin/bash 
else
  docker run -it \
    -v "${SRC_DIR}:/src" \
    -v "${CACHE_DIR}:/tmp/hugo_cache" \
    -p "${PORT}:${PORT}" \
    -w /src \
    --user "${USER_ID}:${GROUP_ID}" \
    "${IMAGE}" "$@"
fi
