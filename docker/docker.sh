#!/usr/bin/env bash
set -eux

docker build -t juno-tester .

docker run -it \
    --volume /Users/goretkin/projects/LoggingPlayground:/LoggingPlayground \
    --workdir="/LoggingPlayground" \
    -e DISPLAY=host.docker.internal:0 \
    juno-tester \
    /bin/bash



