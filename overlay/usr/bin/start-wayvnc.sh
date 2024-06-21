#!/usr/bin/env bash
###
# File: start-wayvnc.sh
# Project: bin
# File Created: Friday, 21th June 2024 3:35:00 pm
# Author: t8d (t8d@pm.me)
# -----
# Last Modified: Friday, 21th June 2024 3:35:00 pm
# Modified By: t8d (t8d@pm.me)
###
set -e
source /usr/bin/common-functions.sh

# CATCH TERM SIGNAL:
_term() {
    kill -TERM "$wayvnc_pid" 2>/dev/null
}
trap _term SIGTERM SIGINT

## EXECUTE PROCESS:
