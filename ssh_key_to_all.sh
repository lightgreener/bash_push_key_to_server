#!/bin/env bash

# Author : Henry
# Bash script 
# 16/06/21

## check user who exists or not
#id $1 &>/dev/null
#if [ $? -ne 0 ];then
## if not then add this user and create password as well
#[  $? -ne 0 ] && useradd $1 && echo 123 |passwd --stdin $1 &>/dev/null
#

{
	id $1
	[  $? -ne 0 ] && useradd $1 && echo 123 |passwd --stdin $1 
}&>/dev/null    # simplifed 

# check installation of expect
rpm -q expect
[ $? -ne 0 ] && yum -y install expect && echo "expect successully installed" 

# check rsa file if not, then create id_rsa file
/usr/bin/expect <<-END 
spawn su - $i
expect {
	"$" { send "[  ! -f /home/$1/.ssh/id_rsa ] && ssh-keygen -P '' -f id_rsa &>/dev/null\r }

}
	expect eof
	END 


