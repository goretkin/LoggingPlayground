#!/usr/bin/env bash
set -eux

docker build -t juno-tester .

docker run -it \
    --volume /Users/goretkin/projects/LoggingPlayground/vscode-extension-tester:/vscode-extension-tester \
    --workdir="/vscode-extension-tester" \
    juno-tester \
    /bin/bash



