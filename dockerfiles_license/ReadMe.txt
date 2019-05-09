1. how to build 
	docker build -t tc10:license --isolation=hyperv .
2. how to use
	docker run --isolation=hyperv -d -v c:\lic:c:\lic tc10:license
lic 文件夹下放splm9.lic并映射到容器内c:\lic,如不映射此文件夹，则默认使用容器内临时许可