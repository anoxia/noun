# Noun 

❤️ 致力于提供简单、灵活自定义的本地 PHP 开发环境，默认提供 nginx + php-fpm + MySQL + Redis 搭配。

镜像、端口与密码等默认配置：

```properties
# 工作目录
WORKSPACE = /path/to/workspace

# Runtime
NGINX_IMAGE = nginx:stable-alpine

# Database
IMAGE_MYSQL = mysql/mysql-server:5.7
IMAGE_REDIS = redis:5
IMAGE_MONGO = mongo:5.0
IMAGE_DYNAMODB = amazon/dynamodb-local

# 服务端口配置
NGINX_PORT = 6000
REDIS_PORT = 6379
MYSQL_PORT = 3306
DYNAMO_PORT = 8000
MONGO_PORT = 27017

# MYSQL 默认密码
MYSQL_ROOT_PASSWORD = 123456

```

## 运行

第一次使用需要对 WORKSPACE 进行初始化，执行以下命令

```Bash
sh init.sh
```

启动 **Runtime** (Nginx && PHP-FPM)

```bash
cd runtime && docker-compose up -d
```

启动 **db** 

```bash
cd db && docker-compose up -d
```


## 结构说明

在正式启动服务之前，熟悉目录结构有助于后续操作与自定义。

```Bash
├── env    # docker-compose 配置，runtime 与 db 下均有软链指向该文件，镜像、端口等在此配置
├── code    # 项目代码目录，在 runtime/vhost 目录进行配置其 vhost
├── db      # 数据库目录，所有数据库服务文件在此目录
│  ├── data
│  │  ├── mysql
│  │  └── redis
│  ├── docker-compose.yaml
├── init.sh
└── runtime    # Nginx 与 PHP 目录
   ├── docker-compose.yaml
   ├── php.ini
   ├── php
   │  └── Dockerfile
   ├── nginx.conf
   └── vhosts
      └── laravel.conf
```

**值得注意**的是，db 和 runtime 分离有助于将数据库服务与运行时分离，便于各自重启变更等。

## 其它

在 `runtime` 与 `db` 目录 README 文件中包含更多配置示例以供参考。
