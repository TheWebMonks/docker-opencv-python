#!/bin/bash
set -e

# Define help message
show_help() {
    echo """
Usage: docker run <imagename> COMMAND

Commands

python     : Run a python command
bash       : Start a bash shell
help       : Show this message
"""
}

# Run
case "$1" in
    python)
        # Fix the webcam
        # http://stackoverflow.com/questions/29274638/opencv-libdc1394-error-failed-to-initialize-libdc1394
        ln /dev/null /dev/raw1394
        python "${@:2}"
    ;;
    bash)
        # Fix the webcam
        # http://stackoverflow.com/questions/29274638/opencv-libdc1394-error-failed-to-initialize-libdc1394
        ln /dev/null /dev/raw1394
        /bin/bash "${@:2}"
    ;;
    *)
        show_help
    ;;
esac
