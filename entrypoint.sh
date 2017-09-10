#!/usr/bin/env bash

# Install custome python package if requirements.txt is present
if [ -e "${WORKDIR}/requirements.txt" ]; then
    $(which pip) install --user -r ${WORKDIR}/requirements.txt
fi

exec python "$@"
