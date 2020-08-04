#!/bin/bash

#配置这个参数，让Jenkins不要在项目进运行后杀掉进程
export BUILD_ID=dontKillMe

#===============================变量定义===============================
#项目名称
project_name=pipline-demo
#jar包名字
jar_name=pipline-demo-0.0.1-SNAPSHOT.jar
#jar运行的目录
jar_dir=/opt/server/${project_name}
#log日志文件名称
log_file=log.out
#jar备份目录
jar_back_dir=/opt/server/${project_name}/backup
#jenkins编译好的jar包存放地址
file_path=/var/lib/jenkins/workspace/${project_name}/target/${jar_name}
#======================================================================

#停止原来的jar进程
pid=`ps -ef | grep ${jar_name} | grep -v grep | awk '{print $2}'`
if [ $pid ]; then
    echo "=====>Stop [${jar_name}] application: ${pid}"
    kill -9 ${pid}
else
    echo "=====>[${jar_name}] process does not exisit."
fi

#项目目录不存在则创建
if [ ! -d ${jar_dir} ]; then
  mkdir -p ${jar_dir}
fi
if [ ! -d ${jar_back_dir} ]; then
  mkdir -p ${jar_back_dir}
fi

#备份原来的jar包
echo "=====>Backup the the original jar to [${jar_back_dir}]..."
cp ${jar_dir}/${jar_name} ${jar_back_dir}

#复制新编译打包好的jar包到运行目录
echo "=====>Copy new jar to [${jar_dir}]..."
cp ${file_path} ${jar_dir}

#运行新jar包
echo "=====>Starting the new jar..."
cd ${jar_dir}
nohup java -jar ${jar_name} >> ${jar_dir}/${log_file} 2>&1 &
echo "=====>Jps"
jps