#!/bin/bash

# docker network create ros

docker run --rm -it \
    --net host \
    --name broker \
    --cap-add=NET_ADMIN \
    --volume="$(dirname $(pwd))":/root/rosjava/src/anyplace-ros \
    ros-kinetic-rosjava \
    bash

# docker network rm ros
# --net ros \
# --name broker \
# --env ROS_HOSTNAME=broker \
# --env ROS_MASTER_URI=http://master:11311 \
