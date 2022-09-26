# ngnix 静态文件

```
#nginx进程数，建议设置为等于CPU总核心数。
worker_processes  4;

#notice：可以忽略的通知日志。
error_log  /var/log/nginx/error.log notice;

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

    #虚拟主机的配置
    server {
        #监听端口
        listen       8083;

        #域名可以有多个，用空格隔开（ 网站绑定域名，可以通过域名访问 )。我们需要注意的是servername匹配分先后顺序，写在前面的匹配上就不会继续往下匹配了。
        server_name  localhost;

       location / {
            root /var/web/test/dist;
            index index.html;
			try_files $uri $uri/ /index.html;
		}

        location ~ ^/nginx/ {
            proxy_pass http://192.168.0.102:8080;
        }
    }
}

```

