#初始化镜像命令

docker build -t sqlserver:2012 --isolation=hyperv .
使用docker images查看生成的镜像
若生成命令错误，镜像名字是none就重新生成

#启动容器

docker run -d -p 1433:1433 -e sa_password=’Infodba@’ -e ACCEPT_EULA=Y --isolation=hyperv sqlserver:2012
