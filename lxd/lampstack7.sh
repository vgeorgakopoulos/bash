#!/bin/bash
lxc copy centos7-template/snap1 webserver1
lxc start webserver1

lxc copy centos7-template/snap1 webserver2
lxc start webserver2

lxc copy centos7-template/snap1 dbserver 
lxc start dbserver

lxc copy centos7-template/snap1 lbserver 
lxc start lbserver

lxc copy centos7-template/snap1 nagios 
lxc start nagios

sleep 10s

lxc info webserver1 | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[webservers\]/\[webservers\]\n$(awk '{print $1}')/" /home/vgeorga/lhna/hosts

TEMP="$(lxc info webserver1 | grep 10.97.86 | awk '{print $3}')"

lxc info webserver2 | grep 10.97.86 | awk '{print $3}' | sed -i "s/$TEMP/$TEMP\n$(awk '{print $1}')/" /home/vgeorga/lhna/hosts

lxc info dbserver | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[dbservers\]/\[dbservers\]\n$(awk '{print $1}')/" /home/vgeorga/lhna/hosts

lxc info lbserver | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[lbservers\]/\[lbservers\]\n$(awk '{print $1}')/" /home/vgeorga/lhna/hosts

lxc info nagios | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[monitoring\]/\[monitoring\]\n$(awk '{print $1}')/" /home/vgeorga/lhna/hosts
