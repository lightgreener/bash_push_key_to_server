#!/bin/env bash

# Author : Henry
# Bash script 
# 16/06/21

# below wrote in root.sh 
## check user who exists or not
#id $1 &>/dev/null
#if [ $? -ne 0 ];then
## if not then add this user and create password as well
#[  $? -ne 0 ] && useradd $1 && echo 123 |passwd --stdin $1 &>/dev/null
#

#{
#	id $1
#	[  $? -ne 0 ] && useradd $1 && echo 123 |passwd --stdin $1 
#}&>/dev/null    # simplifed 

# check installation of expect
#rpm -q expect
#[ $? -ne 0 ] && yum -y install expect && echo "expect successully installed" 


ip_file=ip.txt


# check rsa file if not, then create id_rsa file
[  ! -f /home/$1/.ssh/id_rsa ] && ssh-keygen -P '' -f id_rsa &>/dev/null

#while read ip pass  (if file is separate by space, we use while loop )
#do

#done

for i in `cat $ip_file`;  # (if file is separated by : we use for loop) 
do
	ip=`echo $i |cut -d: -f1`
	pass=`echo $i |cut -d: -f2`
	ping -c1 $ip &>/dev/null
	if [ $? -eq 0 ];then
		#/usr/bin/expect <<-END &>/dev/null
		/usr/bin/expect <<END 
		spawn ssh-copy-id root@$ip
expect {
	"yes/no" { send "yes\r";exp_continue }
	"password:" { send "$pass\r" } 
}
expect eof
END
	else
		echo "not executed"
	fi

done

