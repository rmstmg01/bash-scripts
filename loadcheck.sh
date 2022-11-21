#!/usr/bin/bash

# This script can be used to monitor load averge every minute when doing some stress test on the server.
# Run script as bash load.sh


for i in {1..120}
do
  date_time="$(date +"%Y-%m-%d %T")"
  load_avg=`uptime | awk '{print $NF;}'`
  echo "Load Average at" $date_time : $load_avg  >> /root/loadavg.txt
  sleep 60
done


