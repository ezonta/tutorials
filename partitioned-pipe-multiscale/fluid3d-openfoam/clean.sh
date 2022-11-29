#!/bin/sh
cd ${0%/*} || exit 1    # Run from this directory

echo "Cleaning..."

# Source tutorial clean functions
. $WM_PROJECT_DIR/bin/tools/CleanFunctions

Participant2="Fluid3D"

# Clean the case
cleanCase
rm -rfv 0
# Create an empty .foam file for ParaView
# Note: ".foam" triggers the native OpenFOAM reader of ParaView.
# Change to ".OpenFOAM" to use the OpenFOAM reader provided with OpenFOAM.
touch ${Participant2}.foam
cd ..
# Remove the log files
rm -fv ${Participant2}_blockMesh.log
rm -fv ${Participant2}_checkMesh.log
rm -fv ${Participant2}_potentialFoam.log
rm -fv ${Participant2}_decomposePar.log
rm -fv ${Participant2}.log
rm -fv ${Participant2}_reconstructPar.log


# Remove the preCICE-related log files
echo "Deleting the preCICE log files..."
rm -fv \
    precice-*.log \
    precice-*.json \

# Output files for preCICE versions before 1.2:
rm -fv \
    iterations-${Participant1}.txt iterations-${Participant2}.txt \
    convergence-${Participant1}.txt convergence-${Participant2}.txt \
    Events-${Participant1}.log Events-${Participant2}.log \
    EventTimings-${Participant1}.log EventTimings-${Participant2}.log

rm -fv .*.address

rm -fv watchpointLeft.txt

echo "Cleaning complete!"
#------------------------------------------------------------------------------
