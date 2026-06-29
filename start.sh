#!/bin/bash
set -e

echo "running start.sh"

if [ -n "${START_COMMAND1}" ]; then
    eval "${START_COMMAND1}"
fi

if [ -n "${START_COMMAND2}" ]; then
    eval "${START_COMMAND2}"
fi

echo "No start command set. Set START_COMMAND1 or START_COMMAND2."
exit 1
