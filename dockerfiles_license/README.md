# 初始化镜像命令

Docker build -t tc10:license --isolation=hyperv .
使用docker images查看生成的镜像
在本地创建c:\lic ,文件夹下放名称为splm9.lic许可证文件

#启动容器

Docker docker run --isolation=hyperv -d -v c:\lic:c:\lic tc10:license