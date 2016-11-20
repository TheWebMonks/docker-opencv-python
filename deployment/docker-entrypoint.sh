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
        python "${@:2}"
    ;;
    bash)
        /bin/bash "${@:2}"
    ;;
    *)
        show_help
    ;;
esac
