#!/bin/bash -eu

. "${NVM_DIR}/nvm.sh"
. version.sh

service=styx

nvm ls "${START_NODE_VERSION}" > /dev/null || { echo "ERROR: Node version ${START_NODE_VERSION} not installed"; exit 1; }
nvm use --delete-prefix "${START_NODE_VERSION}"

. config/env.sh

forever -o ../server.log -e ../error.log -l ../forever.$service.log --uid $service start server.js
