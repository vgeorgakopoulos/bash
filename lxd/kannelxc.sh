#!/bin/bash
lxc copy kannel-template/kannel $1 && lxc start $1

