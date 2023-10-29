#!/usr/bin/env sh

set -e

if [ "${EULA}" = "true" ]; then
    echo "eula=${EULA}" >eula.txt
else
    echo "必须指定 '-e EULA=true' 表示同意 https://www.minecraft.net/en-us/eula 上面的最终用户许可协议才可以继续运行"
    exit 1
fi

exec "$@"