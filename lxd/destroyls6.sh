#!/bin/bash

lxc delete webserver1 --force
lxc delete webserver2 --force
lxc delete dbserver --force
lxc delete lbserver --force
lxc delete nagios --force

cat /home/vgeorga/git/lamp_haproxy/hosts.original > /home/vgeorga/git/lamp_haproxy/hosts

