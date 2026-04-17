#!/bin/bash
#SBATCH --job-name=fv-experiment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=32GB
#SBATCH --time=02:00:00
#SBATCH --output=fv-experiment-%A-%a.log
#SBATCH --error=fv-experiment-%A-%a.err
#SBATCH --array=0-22

PARAM_FILES=(
    "args-fir/parameters-1.00.prm"
    "args-fir/parameters-0.90.prm"
    "args-fir/parameters-0.80.prm"
    "args-fir/parameters-0.70.prm"
    "args-fir/parameters-0.60.prm"
    "args-fir/parameters-0.50.prm"
    "args-fir/parameters-0.40.prm"
    "args-fir/parameters-0.30.prm"
    "args-fir/parameters-0.20.prm"
    "args-fir/parameters-0.10.prm"
    "args-fir/parameters-0.05.prm"
    "parameters.prm"
    "args-fir/parameters-0.05.prm"
    "args-fir/parameters-0.10.prm"
    "args-fir/parameters-0.20.prm"
    "args-fir/parameters-0.30.prm"
    "args-fir/parameters-0.40.prm"
    "args-fir/parameters-0.50.prm"
    "args-fir/parameters-0.60.prm"
    "args-fir/parameters-0.70.prm"
    "args-fir/parameters-0.80.prm"
    "args-fir/parameters-0.90.prm"
    "args-fir/parameters-1.00.prm"
)

STRAIN_FILES=(
    "args-fir/shortening-1.00.dat"
    "args-fir/shortening-0.90.dat"
    "args-fir/shortening-0.80.dat"
    "args-fir/shortening-0.70.dat"
    "args-fir/shortening-0.60.dat"
    "args-fir/shortening-0.50.dat"
    "args-fir/shortening-0.40.dat"
    "args-fir/shortening-0.30.dat"
    "args-fir/shortening-0.20.dat"
    "args-fir/shortening-0.10.dat"
    "args-fir/shortening-0.05.dat"
    "control_points_strain.dat"
    "args-fir/lengthening-0.05.dat"
    "args-fir/lengthening-0.10.dat"
    "args-fir/lengthening-0.20.dat"
    "args-fir/lengthening-0.30.dat"
    "args-fir/lengthening-0.40.dat"
    "args-fir/lengthening-0.50.dat"
    "args-fir/lengthening-0.60.dat"
    "args-fir/lengthening-0.70.dat"
    "args-fir/lengthening-0.80.dat"
    "args-fir/lengthening-0.90.dat"
    "args-fir/lengthening-1.00.dat"
)

ACTIVATION_FILES=(
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "control_points_activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
    "args-fir/activation.dat"
)

OUTPUT_DIRS=(
    "2026_shortening-1.00"
    "2026_shortening-0.90"
    "2026_shortening-0.80"
    "2026_shortening-0.70"
    "2026_shortening-0.60"
    "2026_shortening-0.50"
    "2026_shortening-0.40"
    "2026_shortening-0.30"
    "2026_shortening-0.20"
    "2026_shortening-0.10"
    "2026_shortening-0.05"
    "2026_isometric"
    "2026_lengthening-0.05"
    "2026_lengthening-0.10"
    "2026_lengthening-0.20"
    "2026_lengthening-0.30"
    "2026_lengthening-0.40"
    "2026_lengthening-0.50"
    "2026_lengthening-0.60"
    "2026_lengthening-0.70"
    "2026_lengthening-0.80"
    "2026_lengthening-0.90"
    "2026_lengthening-1.00"
)

#echo "PARAM_FILES:      ${#PARAM_FILES[@]}"
#echo "STRAIN_FILES:     ${#STRAIN_FILES[@]}"
#echo "OUTPUT_DIRS:      ${#OUTPUT_DIRS[@]}"
#echo "ACTIVATION_FILES: ${#ACTIVATION_FILES[@]}"

i=$SLURM_ARRAY_TASK_ID

./flexodeal-lite \
    -PARAMETERS="${PARAM_FILES[$i]}" \
    -BDY_STRAIN="${STRAIN_FILES[$i]}" \
    -ACTIVATION="${ACTIVATION_FILES[$i]}" \
    -OUTPUT_DIR="${OUTPUT_DIRS[$i]}"