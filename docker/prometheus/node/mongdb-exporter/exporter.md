#如果注意 监听端口 9104:9104 ，前面的9104端口是服务器监听的端口不能重复，监听下一个mongodb实例则必须更改；而后面的9104是镜像容器里面的服务端口这个不能更改，
docker run -d -p 9216:9216 -p 17001:17001 percona/mongodb_exporter:0.20 --mongodb.uri=mongodb://root:xxxxx@127.0.0.1:17001
docker run -d -p 9216:9216 -p 17001:17001 percona/mongodb_exporter:0.20 --mongodb.uri=mongodb://127.0.0.1:17001

docker run -d -p 9216:9216 --restart=always --name=mongodb-exporter  percona/mongodb_exporter:0.20 --mongodb.uri=mongodb://admin:123456@192.168.0.187:27017/admin?ssl=false

 --mongodb.uri=mongodb://user:pass@127.0.0.1:27017/admin?ssl=true
#查看容器是否启动了和监听端口是否成功
docker ps  
 
netstat -ntlp | grep 9104
netstat -ntlp | grep 9106