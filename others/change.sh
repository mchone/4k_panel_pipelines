#!/bin/sh
cp chr01_beagle_ref.pbs chr02_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr03_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr04_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr05_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr06_beagle_ref.pbs 
cp chr01_beagle_ref.pbs chr07_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr08_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr09_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr10_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr11_beagle_ref.pbs
cp chr01_beagle_ref.pbs chr12_beagle_ref.pbs
perl -pi -e 's/chr01/chr02/g' chr02_beagle_ref.pbs
perl -pi -e 's/chr01/chr03/g' chr03_beagle_ref.pbs
perl -pi -e 's/chr01/chr04/g' chr04_beagle_ref.pbs
perl -pi -e 's/chr01/chr05/g' chr05_beagle_ref.pbs
perl -pi -e 's/chr01/chr06/g' chr06_beagle_ref.pbs
perl -pi -e 's/chr01/chr07/g' chr07_beagle_ref.pbs
perl -pi -e 's/chr01/chr08/g' chr08_beagle_ref.pbs
perl -pi -e 's/chr01/chr09/g' chr09_beagle_ref.pbs
perl -pi -e 's/chr01/chr10/g' chr10_beagle_ref.pbs
perl -pi -e 's/chr01/chr11/g' chr11_beagle_ref.pbs
perl -pi -e 's/chr01/chr12/g' chr12_beagle_ref.pbs
