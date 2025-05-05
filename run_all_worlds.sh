#!/bin/bash
image_path="nav_competition_image.sif"
log_path=results/out.txt

mkdir -p results     # Ensure the folder exists
rm -f $log_path      # Clear any previous results

for i in {229..359}
do
  echo "Running world $i..."
  ./singularity_run.sh $image_path python3 run.py --world_idx $i --out $log_path
done

echo "All runs completed. Results saved to $log_path."

