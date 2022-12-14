# Mongdb版本号4.2.23

## 设置权限
```
docker run -itd --name mongo  -p 27017:27017 mongo:4.2.23 --auth

docker run -d -p 27017:27017 -v /home/dockerData/mongodb/config/mongo.conf:/data/configdb/mongo.conf -v /home/dockerData/mongodb/db:/data/db -v /home/dockerData/mongodb/log:/data/log --name mongo mongo:4.2.23 --auth


// 进入容器
docker exec -it mongo mongo admin
// 添加管理员用户
db.createUser({ user:'admin',pwd:'123456',roles:[ { role:'userAdminAnyDatabase', db: 'admin'}]});
// 认证
 db.auth('admin', '123456')

// 创建test库
use test
// 设置test库的用户和密码
db.createUser({user:'admin',pwd:'123456',roles:['readWrite']})
// 通过账号密码登录  并添加users集合数据
db.auth("admin","123456!")
db.users.insert( { name:"test1", age:22} )

//查看用户
show users
```
db.createUser({ user:'wdk-wrist',pwd:'Wristpwd1!',roles:[ { role:'userAdminAnyDatabase', db: 'admin'}]});
db.auth('wdk-wrist', 'Wristpwd1!')

db.createUser({user:'wdk-radiation-area',pwd:'Radiation2022',roles:['readWrite']})
db.auth('wdk-radiation-area', 'Radiation2022')
show users

https://blog.csdn.net/qq_43021786/article/details/125429982
  947  ls -l
  948  mongo -u admin -p
  949  cat /etc/mongod.conf
  950  mongo -u admin -p
  951  mongo -u wdk-radiation-area -p
  952  mongo -u wdk-radiation-area -p Radiation2022
  953  mongo -u wdk-radiation-area -p Radiation2022 loalhost/radiation_area
  954  mongo -u wdk-radiation-area -p Radiation2022 139.196.136.106:27017/radiation_area
  955  mongo -u root -p Radiation2022 139.196.136.106:27017/radiation_area
  956  mongo -u root -p 123456 139.196.136.106:27017/radiation_area
  957  mongo -u admin -p Radiation2022 139.196.136.106:27017/radiation_area
  958  mongo -u admin -p 123456 139.196.136.106:27017/radiation_area
  959  mongo -u admin -p Wdkroot1 139.196.136.106:27017/radiation_area
  960  mongo -u wdk-radiation-area -p Radiation2022 139.196.136.106:27017/radiation_area
  961  clear
  962  history
  963   mongo --authenticationDatabase admin -u admin -p Wdkadmin1
  964  mongo --authenticationDatabase admin -u admin -p Wdkadmin1
  965  mongo -u admin -p Wdkadmin1 139.196.136.106:27017/radiation_area
  966  mongo -u admin -p Wdkadmin1 139.196.136.106:27017
  967  mongo -u admin -p Wdkadmin1
  968  mongo -u admin -p
  969  
  970  docker ps


  /var/log/mongodb