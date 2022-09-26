# ngnix 负载均衡配置

```
#nginx进程数，建议设置为等于CPU总核心数。
worker_processes  4;

#notice：可以忽略的通知日志。
error_log  /var/log/nginx/error.log debug;

#进程pid文件
pid        /var/run/nginx.pid;

events {

    #单个进程最大连接数
    worker_connections  1024;

}

#设定http服务器，利用它的反向代理功能提供负载均衡支持
http {
    #文件扩展名与文件类型映射表
    include       mime.types;

    #默认文件类型
    default_type  application/octet-stream;

    #开启高效文件传输模式 零拷贝
    sendfile        on;

    #长连接超时时间，单位是秒
    keepalive_timeout  65;

    #Nginx反向代理服务器会 采用默认的轮询策略
    upstream server-pool{
   		server 192.168.0.102:8081;
   		server 192.168.0.102:8082;
    }

    #Nginx反向代理服务器会 权重
   # upstream server-pool{
   # server 192.168.0.102:8081 weight=1;
   # server 192.168.0.102:8082 weight=10;
   # }

    #Nginx反向代理服务器会 根据ip传入固定机器
    #upstream server-pool{
	#ip_hash;
	#server 192.168.0.102:8081;
	#server 192.168.0.102:8082;
    #}


    #虚拟主机的配置
    server {
        #监听端口
        listen       8080;

        #域名可以有多个，用空格隔开（ 网站绑定域名，可以通过域名访问 )。我们需要注意的是servername匹配分先后顺序，写在前面的匹配上就不会继续往下匹配了。
        server_name  localhost;

       location / {
			proxy_pass  http://server-pool;
		}

    }

}
```