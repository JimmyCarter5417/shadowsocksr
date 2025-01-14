#!/bin/bash
cd `dirname $0`
python_ver=$(ls /usr/bin|grep -e "^python[23]\.[1-9]\+$"|tail -1)
#eval $(ps -ef | grep "[0-9] ${python_ver} server\\.py a" | awk '{print "kill "$2}')
ulimit -n 512000
if [ -n $1 ]; then
        nohup ${python_ver} server.py -c $1 a>> ssserver_$(basename $1).log 2>&1 &
else
        nohup ${python_ver} server.py a>> ssserver.log 2>&1 &
fi

