#!/usr/bin/env bash
###
# File: start-wayfire.sh
# Project: bin
# File Created: Friday, 21th June 2024 3:04:00 pm
# Author: t8d (t8d@pm.me)
# -----
# Last Modified: Friday, 21th June 2024 3:04:00 pm
# Modified By: t8d (t8d@pm.me)
###
set -e
source /usr/bin/common-functions.sh

# CATCH TERM SIGNAL:
_term() {
    kill -TERM "$wayfire_pid" 2>/dev/null
}
trap _term SIGTERM SIGINT

# EXECUTE PROCESS:
# Wait for udev
# Wait for udev
if [ $(grep autostart /etc/supervisor.d/udev.ini 2> /dev/null) == "autostart=true" ]; then
    wait_for_udev
fi
# Run Wayfire
# TODO: find and add wayfire options
/usr/bin/wayfire & wayfire_pid=$!

# WAIT FOR CHILD PROCESS:
wait "$wayfire_pid"