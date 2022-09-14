#!/bin/bash

# 设置常量
PROJECT_NAME_JAR=xxx.jar

#文件地址
WORKSPACE=/xx/xxx

cd ${WORKSPACE}

echo '1：kill进程'

PID=$(ps -ef |grep ${PROJECT_NAME_JAR} | grep -v grep | awk '{print $2}')

if [[ -z ${PID} ]]; then
        echo "The task is not running"
else
        echo "kill pid:"${PID}
        kill -9 ${PID}
fi


echo '2：启动中'

nohup java -jar ${PROJECT_NAME_JAR} --spring.profiles.active=prod >/dev/null 2>&1 &
