#!/bin/bash  
THRESHOLD=80
MAILTO="anil93saini@gmail.com anil94saini@gamil.com"
HOSTNAME=$(hostname)
for diskN in `df -h | grep -vE 'FileSystem|tmpfs' | awk '{ print $5}' | sed 's/%//g'`
do
	 if [ $diskN -ge $THRESHOLD ] ; then  
		df -h | grep $diskN% >> /tmp/temp 
	 fi
done
VALUE=`cat /tmp/temp | wc -l`
if [ $VALUE -ge '1' ] ; then  
	mail -s '${HOSTNAME}Disk Space Alert' $MAILTO </tmp/temp
fi

rm -rf /tmp/temp
