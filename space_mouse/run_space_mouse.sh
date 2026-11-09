#!/bin/bash

# usage:
# $ ./run_space_mouse.sh  [ip [ros_master_uri]]
#

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

sudo chmod a+rw /dev/hidraw*

export ROS_IP=${1:-"localhost"}
export ROS_MASTER_URI=${2:-"http://${ROS_IP}:11311/"}

## simulation
#export ROS_MASTER_URI="http://133.15.97.61:11400/"
export ROS_HOSTNAME=${ROS_IP}

source /opt/ros/one/setup.bash
python3 space_mouse_node.py &
wait
