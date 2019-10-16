#!/bin/bash
apt-get update
mkdir -p /catkin_ws/src/
cp -r /code /catkin_ws/src/
mv /catkin_ws/src/code /catkin_ws/src/sba_python

cd /catkin_ws
rosdep install --from-paths src --ignore-src -r -y
catkin_make
