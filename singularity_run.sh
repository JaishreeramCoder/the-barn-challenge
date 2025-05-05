#!/bin/bash
#
# Usage:
#   ./singularity_run.sh <singularity_image> <command> [args...]
#

IMAGE="$1"
shift

# we assume DISPLAY & XAUTHORITY are already exported on the host,
# and xhost has been run.

singularity exec \
    -B "$(pwd)":/jackal_ws/src/the-barn-challenge \
    -B /tmp/.X11-unix:/tmp/.X11-unix \
    -B "${XAUTHORITY}:${XAUTHORITY}:ro" \
    "${IMAGE}" \
    /bin/bash /jackal_ws/src/the-barn-challenge/entrypoint.sh "$@"

