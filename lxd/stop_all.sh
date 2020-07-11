#!/bin/bash

ALL_CONTAINERS="$(lxc list | awk '$4 != "STOPPED"' | awk '{ print $2 }')"
for i in $ALL_CONTAINERS
do
if [ $i != "NAME" ]
then
lxc stop $i
fi
done

