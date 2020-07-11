#!/bin/bash
lxc copy centos7-template/snap1 $1 && lxc start $1

