#!/usr/bin/env bash
set -eo pipefail

# 初始化工作目录
(echo "WORKSPACE = $(pwd)" && sed -e '/WORKSPACE/d' .env) > .env.tmp && mv .env.tmp .env

# 创建 env 快链
ln -sf `pwd`/.env runtime/
ln -sf `pwd`/.env db/

# 提示安装 docker-compose，如果未安装
if [ ! "$(command -v docker-compose)" ]; then
  echo -e "\033[41;47m > Warning: 检测到未安装 docker-compose 请留意 \033[0m"
else
  echo -e "\033[32m > Done! \n > 请按需前往 runtime 与 database 目录启动服务 \033[0m"
fi
