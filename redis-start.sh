#!/bin/sh

str=`docker ps -f 'name=redis-server'`
str2=`docker ps -a -f 'name=redis-server'`

 # if redis-server is running,do noting 
if test expr index $str "redis-server" > 0  then
   exit 0
fi

if test expr index $str2 "redis-server" >0  then
   docker start redis-server
   exit 0
fi
    
   docker run -d -p 6379:6379 -v $PWD/data:/data --name redis-server redis
   exit 0
