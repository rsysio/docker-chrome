#!/usr/bin/env bash

# Install custome python package if requirements.txt is present
if [ -e "/usr/scr/app/requirements.txt" ]; then
    $(which pip) install --user -r /usr/src/app/requirements.txt
fi

exec python "$@"
