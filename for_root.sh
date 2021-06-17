#!/bin/env bash

# Author : Henry
# bash
# 17/06/21

# check application
rpm -q expect 
[ $? -ne 0  ] && yum -y install expect && echo "expect installed success"

#check user
{
id yumwei
[ $? -ne 0 ] && useradd yumwei && echo 123|passwd -stdin yunwei
} &>/dev/null


