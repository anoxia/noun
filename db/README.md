## 启动

在启动服务之前，请使用一下指令进行初始化内容替换（将 workspace 路径设置为当前目录）。

```Bash
(echo "WORKSPACE = $(pwd)" && sed -e '/WORKSPACE/d' .env) > .env.tmp && mv .env.tmp .env

mkdir -p data
cp -rf template/* data/
```
