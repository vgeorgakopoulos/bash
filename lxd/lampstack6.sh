#!/bin/bash
lxc copy centos6-template/snap2 webserver1
lxc start webserver1

lxc copy centos6-template/snap2 webserver2
lxc start webserver2

lxc copy centos6-template/snap2 dbserver 
lxc start dbserver

lxc copy centos6-template/snap2 lbserver 
lxc start lbserver

lxc copy centos6-template/snap2 nagios 
lxc start nagios

sleep 10s

lxc info webserver1 | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[webservers\]/\[webservers\]\n$(awk '{print $1}')/" /home/vgeorga/git/lamp_haproxy/hosts

TEMP="$(lxc info webserver1 | grep 10.97.86 | awk '{print $3}')"

lxc info webserver2 | grep 10.97.86 | awk '{print $3}' | sed -i "s/$TEMP/$TEMP\n$(awk '{print $1}')/" /home/vgeorga/git/lamp_haproxy/hosts

lxc info dbserver | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[dbservers\]/\[dbservers\]\n$(awk '{print $1}')/" /home/vgeorga/git/lamp_haproxy/hosts

lxc info lbserver | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[lbservers\]/\[lbservers\]\n$(awk '{print $1}')/" /home/vgeorga/git/lamp_haproxy/hosts

lxc info nagios | grep 10.97.86 | awk '{print $3}' | sed -i "s/\[monitoring\]/\[monitoring\]\n$(awk '{print $1}')/" /home/vgeorga/git/lamp_haproxy/hosts

