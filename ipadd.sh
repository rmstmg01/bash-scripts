#!/bin/bash

# This script takes list of IPs from file ip.txt file and creates ip configuration file for each IP.
# This script becomes handy when you need to add multiple IPs on the same network interface of RHEL based servers like CentOS/Fedora.
#Please update ip.txt file, netmask and gateway variable as your need.
count=0
netmask=255.255.255.0
gateway=192.168.0.1
while read line;

do
     echo "Creating eth0:$count with IP: $line" ;
     filename=/etc/sysconfig/network-scripts/ifcfg-eth0:$count
     echo -e "DEVICE=eth0:$count\nBOOTPROTO=static\nIPADDR=$line\nNETMASK=$netmask\nGATEWAY=$gateway\nONBOOT=yes\n" > $filename
     chmod 644 $filename
     count=$((count+1))
done < ip.txt
