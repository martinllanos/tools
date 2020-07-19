#!/bin/sh
cd ~/server/13/sources
dirs=`ls -1d */`
for d in $dirs
do
  echo `cd $d; git pull`
done
