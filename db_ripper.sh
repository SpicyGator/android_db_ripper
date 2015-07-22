#!/bin/bash

#list database directories in /data/data 
#awk prepends "." to path to make directories in current folder
#xargs passes list to mkdir to recreate directory tree
adb shell "find /data/data/*/databases -type d" | tr '\r' ' ' | awk '{print "." $0}' | xargs -n1 mkdir -p

#list db files in /data/data and export to file
adb shell "find /data/data/ | grep .db" | tr '\r' ' ' | awk '{print "." $0}' > db_list

#iterate through file list pulling each file into the locally created directory
while read p; do
	adb pull $p $p
done < db_list
