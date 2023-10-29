#!/usr/bin/env sh

set -e

if [ "${EULA}" = "true" ]; then
    echo "eula=${EULA}" >eula.txt
else
    echo ${EULA}
    echo "必须指定环境变量 'EULA' 的值为 'true' 表示同意 https://www.minecraft.net/en-us/eula 上面的最终用户许可协议才可以继续运行"
    exit 1
fi

sed -i "s/-Xms.G/-Xms${XMS}/g" user_jvm_args.txt
sed -i "s/-Xmx.G/-Xmx${XMX}/g" user_jvm_args.txt

exec "$@"