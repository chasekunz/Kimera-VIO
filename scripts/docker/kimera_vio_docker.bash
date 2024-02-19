#!/bin/bash

# Allow X server connection
xhost +local:root

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")

docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/dev/dri:/dev/dri" \
    --volume="/home/chase/Downloads/euroc_datasets/:/data/datasets/Euroc" \
    --volume="$SCRIPT_DIR/../../:/root/Kimera-VIO" \
    kimera_vio

# Disallow X server connection
xhost -local:root