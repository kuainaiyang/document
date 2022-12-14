FROM openjdk:8u121
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY radiation-0.0.1-SNAPSHOT.jar /home/prod/app.jar
ENTRYPOINT ["java","-jar","-Duser.timezone=GMT+08","/home/prod/app.jar"]