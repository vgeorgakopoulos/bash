#!/bin/bash
lxc copy centos6-template/snap2 $1 && lxc start $1

