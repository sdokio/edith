#!/bin/bash
while true
do
  $(ls -l --time-style=full /app/data | grep ^[^d] | awk '{printf "%-11s%-9s　%s\n",$6,substr($7,1,8),$9}' > /app/data/list.txt)
  sleep 1 #间隔时间，整数，单位秒，取值范围0~60
done
