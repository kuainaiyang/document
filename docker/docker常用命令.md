
### Docker帮助命令
1. docker version #显示docker版本信息
2. docker info # 显示docker系统信息，包括镜像和容器数量
3. docker  命令 --help #帮助命令，可以通过这个命令，查看docker命令的具体用法
   
### Docker镜像命令
1. docker search 关键字 # 搜索相关镜像
2. docker pull 镜像名  #拉取镜像到本地
3. docker rmi 镜像名或id #删除镜像
4. docker images #查看本地所有镜像

### Docker容器命令
1. docker run 参数 镜像名或id #创建容器并启动
2. docker ps #查看运行中的镜像
3. docker start 容器id #启动容器
4. docker stop 容器id #停止容器
5. docker restart 容器id #重启容器
6. docker kill 容器id #强制停止容器

**docker run 参数说明**
 1. --name='name'  #容器名称
 2. -d  #后台方式运行
 3. -e #容器参数
 4. -it #交互方式运行，启动后会进入容器
 5. -p [ip可选]主机端口：容器端口 #端口映射
   
**docker ps 参数说明** 
 1. -a #查看所有容器
 2. -n=? #显示最近创建的容器
 3. -q #只显示容器的编号

**进入容器** 
1. docker exec -it 容器id bashShell #进入容器(bashShell一般用/bin/bash即可)，可以操作
2. docker attach 容器id #进入当前容器，不会id新的进程
   
### Docker其他命令
1. docker inspect 容器id #查看容器元数据新
2. docker top 容器id #查看容器进程信息
3. docker cp 容器id：容器内路径 宿主机路径 #将容器内文件拷贝到宿主机
4. docker cp 文件或目录 容器id:容器内路径 #将宿主机文件拷贝到容器
5. docker logs 参数 容器id #查看容器日志信息
6. docker stats #实时查看docker容器cpu内存使用情况

### DockerCompose其他命令
1. docker-compose stop    停止容器
2. docker-compose rm -f   删除已停止的所有service
3. docker-compose up -d  后台执行该服务
4. docker-compose up       启动服务
5. docker-compose  logs -f  查看日志
6. docker load -i 载入文件


