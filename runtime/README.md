
推荐在 code 目录存放多个项目，通过 vhost 配置共享一套运行环境

## xdebug

当我们在使用 xdebug 进行断点调试时，需要保证容器内代码路径与宿主机文件路径一致（默认已处理好，vhost 中配置时请注意，可以通过 `docker-compose config` 查看当前所使用的 config 信息，从中获取文件挂载及端口映射等相关信息）。

在 php.ini 中为 xdebug 配置宿主机 ip 用以提供 IDE Debugger 连接信息，配置示例：

```ini
[Xdebug]
xdebug.mode = debug
xdebug.start_with_request = yes
; 扩展运行日志路径，记录 Xdebug 详细运行 trace
xdebug.log = /tmp/xdebug.log
; client_host 为宿主机 IP
; 启用 Xdebug 后每次 PHP 执行，Xdebug 扩展会通过 debuger 协议自动连接宿主机调试器
xdebug.client_host = docker.for.mac.host.internal
xdebug.client_port = 9003
```

## 附录

### mac 上 docker 内访问宿主机

Docker For Mac的Docker Daemon是运行于虚拟机(xhyve)中的, 而不是像Linux上那样作为进程运行于宿主机，因此Docker For Mac没有docker0网桥
访问方式
1、docker for mac 的容器里可以通过 docker.for.mac.host.internal 域名直接访问宿主机服务
2、docker inspect <container_id> 命令，可以查看到容器的网络配置

### PHP 扩展列表

PHP 镜像默认提供以下扩展：

```
[PHP Modules]
bcmath
Core
ctype
curl
date
dom
fileinfo
filter
ftp
hash
iconv
json
libxml
mbstring
mongodb
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
tokenizer
xdebug
xml
xmlreader
xmlwriter
yaconf
yaf
zlib

[Zend Modules]
Xdebug
```
