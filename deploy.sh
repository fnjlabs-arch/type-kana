#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

npm run build

rsync -zhave ssh --progress build himawari.fun:/opt/node
ssh himawari.fun "
    cd /opt/node && \
    systemctl stop sadsha-kana.service && \
    rm -rf sadsha-kana && \
    mv build sadsha-kana && \
    chown -R node:node sadsha-kana && \
    systemctl start sadsha-kana.service
"