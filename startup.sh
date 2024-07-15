#!/bin/bash

# Default command
CMD="jupyter lab --allow-root --ip=0.0.0.0 --no-browser \
     --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False \
     --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' \
     --ServerApp.allow_credentials=True --notebook-dir=/home/projects"

# # If a command is passed to the script, run that instead
# if [ $# -gt 0 ]; then
#     exec "$@"
# else
#     # Otherwise, run the default command
#     exec $CMD
# fi

# Print debug information
print_debug_info "$@"

# If a command is passed to the script, run that instead
if [ $# -gt 0 ]; then
    [ "$DEBUG" != "false" ] && echo "Executing provided command: $@"
    exec "$@"
else
    # Otherwise, run the default command
    [ "$DEBUG" != "false" ] && echo "Executing default command: $CMD"
    exec $CMD
fi