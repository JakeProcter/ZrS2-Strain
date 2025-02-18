#!/bin/bash

base_dir=$(pwd)

directories=(
    "+8percent"
    "+7percent"
    "+6percent"
    "+5percent"
    "+4percent"
    "+3percent"
    "+2percent"
    "+1percent"
    "+0percent"
    "-1percent"
    "-2percent"
    "-3percent"
    "-4percent"
    "-5percent"
    "-6percent"
    "-7percent"
    "-8percent"
)

for dir in "${directories[@]}"; do
    full_path="$base_dir/$dir"

    if [ -d "$full_path" ]; then
        timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        echo "[$timestamp] Starting calculation in $dir"

        cd "$full_path" || { echo "Failed to enter $full_path"; exit 1; }

        # Run AIMS
        mpirun -n 40 ../../aims.220429.scalapack.mpi.x > aims.out 2>&1

        timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        echo "[$timestamp] Finished calculation in $dir"

        cd "$base_dir" || { echo "Failed to return to $base_dir"; exit 1; }
    fi
done

