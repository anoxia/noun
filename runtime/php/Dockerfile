ARG BASE_IMAGE
FROM $BASE_IMAGE

# 安装扩展
RUN docker-php-ext-install intl; \
    docker-php-ext-install sockets; \
    docker-php-ext-install zip; \
    docker-php-ext-install ftp; \
    docker-php-ext-install bcmath; \
    docker-php-ext-install snmp; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-install pcntl; \
    # 安装第三方扩展
    mkdir -p /usr/src/php/ext/yaconf; \
    curl -L "https://pecl.php.net/get/yaconf-1.1.2.tgz" | tar xvz -C /usr/src/php/ext/yaconf --strip 1; \
    docker-php-ext-install yaconf; \
    mkdir -p /usr/src/php/ext/redis; \
    curl -L "https://pecl.php.net/get/redis-5.3.7.tgz" | tar xvz -C /usr/src/php/ext/redis --strip 1; \
    docker-php-ext-install redis; \
    mkdir -p /usr/src/php/ext/mongodb; \
    curl -L "https://pecl.php.net/get/mongodb-1.10.0.tgz" | tar xvz -C /usr/src/php/ext/mongodb --strip 1; \
    docker-php-ext-install mongodb; \
    mkdir -p /usr/src/php/ext/xdebug; \
    curl -L "https://pecl.php.net/get/xdebug-3.1.5.tgz" | tar xvz -C /usr/src/php/ext/xdebug --strip 1; \
    docker-php-ext-install xdebug; \
    mkdir -p /usr/src/php/ext/yaf; \
    curl -L "https://pecl.php.net/get/yaf-3.3.5.tgz" | tar xvz -C /usr/src/php/ext/yaf --strip 1; \
    docker-php-ext-install yaf; \
    docker-php-source delete

# # 安装 GD 扩展(如果需要 GD 扩展，请自行开启)
# RUN apt-get update -y; \
#     apt-get install -y \
#         zlib1g-dev \
#         libpng-dev \
#         libicu-dev \
#         libzip-dev \
#         libssl-dev \
#         libsnmp-dev; \
#     docker-php-ext-install gd

# 默认不开启 xdebug 扩展
# 需要开启请于 php.ini 文件中启用与配置
RUN rm /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    rm /usr/local/etc/php/conf.d/docker-php-ext-yaconf.ini

# 安装 composer 工具
RUN curl -sS https://getcomposer.org/installer | php; \
    mv composer.phar /usr/local/bin/composer; \
    chmod +x  /usr/local/bin/composer
