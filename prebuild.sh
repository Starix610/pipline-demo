#!/bin/bash
#由于服务器内存不足，有可能会导致构建失败。这里先直接kill掉原来的jar进程，释放一点内存，降低构建失败的概率。
#后面的Post Steps的脚本选择"不管是否构建成功都执行"，构建失败会再次启动原来的jar，构建成功之后会启动新的jar。

#jar包名字
jar_name=pipline-demo-0.0.1-SNAPSHOT.jar

#停止原来的jar进程
pid=`ps -ef | grep ${jar_name} | grep -v grep | awk '{print $2}'`
if [ $pid ]; then
    echo "=====>Stop [${jar_name}] application: ${pid}"
    kill -9 ${pid}
else
    echo "=====>[${jar_name}] process does not exisit."
fi