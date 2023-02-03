#!/usr/bin/sh
#---------------------------------------------------------------------------
# Filename:     myhealth
# Node(s):      All Linux System Log collection
# Info:         System log collections script
# Author :      Palash Biswas
#---------------------------------------------------------------------------

HOST1=`hostname`
dir=/tmp
#dir=$PWD
d=$(date +%Y%m%d-%H%M%S)
filename=myhealth_$HOST$HOST1"-"$d
touch $dir/$filename.txt
file="$dir/$filename.txt"
echo $file

echo "====================================== System date ======================================" >>$file  2>&1
date >>$file  2>&1
echo "==================================== System Hostname ====================================" >>$file  2>&1
hostname >>$file  2>&1
echo "================================ Red Hat release version ================================" >>$file  2>&1
cat /etc/redhat-release >>$file  2>&1
echo "==================================== System Up time =====================================" >>$file  2>&1
uptime >>$file  2>&1
echo "=================================== "uname -a" output ===================================" >>$file  2>&1
uname -a >>$file  2>&1
echo "============================== List all info about system ===============================" >>$file  2>&1
dmidecode -t SYSTEM >>$file  2>&1
echo "=============================== Mountpoint with Data Log ================================" >>$file  2>&1
#mount >>$file  2>&1
#echo "================================== Mounted FileSystem ===================================" >>$file  2>&1
df -h >>$file  2>&1
echo "============================== Line of Mounted FileSystem ===============================" >>$file  2>&1
df -h | wc -l >>$file  2>&1
echo "====================================== Fstab Entry ======================================" >>$file  2>&1
cat /etc/fstab >>$file  2>&1
echo "===================================== Line of Fstab =====================================" >>$file  2>&1
cat /etc/fstab | wc -l >>$file  2>&1
echo "===================================== IP Information ====================================" >>$file  2>&1
ifconfig -a >>$file  2>&1
echo "=============================== Display the routing table ===============================" >>$file  2>&1
netstat -nr >>$file  2>&1
echo "================================= Line of Routing table =================================" >>$file  2>&1
netstat -nr|wc -l >>$file  2>&1
echo "====================================== Hosts Entry ======================================" >>$file  2>&1
cat /etc/hosts >>$file  2>&1
echo "================================= Complete User Details =================================" >>$file  2>&1
cat /etc/passwd >>$file  2>&1
echo "================================ Complete Group Details =================================" >>$file  2>&1
cat /etc/group >>$file  2>&1
echo "=============================== installonly_limit Number ================================" >>$file  2>&1
grep installonly_limit /etc/yum.conf >>$file  2>&1
echo "============================ State of SELinux on the system =============================" >>$file  2>&1
cat /etc/sysconfig/selinux >>$file  2>&1
echo "======================== During boot script "/etc/rc.d/rc.local" ========================" >>$file  2>&1
cat /etc/rc.d/rc.local >>$file  2>&1
#echo "==============================  ==============================" >>$file  2>&1
#>>$file  2>&1
#echo "==============================  ==============================" >>$file  2>&1
#>>$file  2>&1
#echo "==============================  ==============================" >>$file  2>&1
#>>$file  2>&1
#echo "==============================  ==============================" >>$file  2>&1
#>>$file  2>&1
#echo "==============================  ==============================" >>$file  2>&1
#>>$file  2>&1
#fi
chmod 777 $file
