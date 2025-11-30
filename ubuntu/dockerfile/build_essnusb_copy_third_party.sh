#!/bin/bash
# functions
check_lib_exists(){
 if [ -f "$1" ]; then
    echo "$1 exists. Build is successful"
 else 
    echo "$1 does not exist. Exiting installation ..."
    exit 1
 fi
}
# end functions
#####################################################

fw_directory=${PWD}

cd ../..
base_directory=${PWD}

third_party_dir=third_party

root_dir=${base_directory}/${third_party_dir}/cern_root
dependencies_dir=${base_directory}/${third_party_dir}/dependencies
geant4_dir=${base_directory}/${third_party_dir}/geant4_11_3
genfit_dir=${base_directory}/${third_party_dir}/genfit
genie_dir=${base_directory}/${third_party_dir}/genie
googletest_dir=${base_directory}/${third_party_dir}/googletest
fairlogger_dir=${base_directory}/${third_party_dir}/fairlogger
framework_dir=${fw_directory}/framework
pathfinder_dir=${base_directory}/${third_party_dir}/PathFinder
vgm_dir=${base_directory}/${third_party_dir}/vgm

cd ${fw_directory}

# Copy third party libs and extract downloads
mkdir pythia6
cd ${fw_directory}
cp -R ${dependencies_dir}/genie/pythia6/v6_428/lib ./pythia6
cp -R ${dependencies_dir}/genie/pythia6/v6_428/inc ./pythia6

mkdir log4cpp
cd ${fw_directory}
cp -R ${dependencies_dir}/genie/log4cpp/install/lib ./log4cpp
cp -R ${dependencies_dir}/genie/log4cpp/install/include ./log4cpp

mkdir clhep
cd ${fw_directory}
cp -R ${dependencies_dir}/geant4/2.4.6.4/install/lib ./clhep
cp -R ${dependencies_dir}/geant4/2.4.6.4/install/include ./clhep
cp -R ${dependencies_dir}/geant4/2.4.6.4/install/bin ./clhep

cd ${fw_directory}

cd ${framework_dir}/workspace
mkdir genie
cd genie
mkdir download
cd download
curl -O https://scisoft.fnal.gov/scisoft/packages/genie_xsec/v3_06_00/genie_xsec-3.06.00-noarch-G1802a00000-k250-e1000.tar.bz2
tar -xf genie_xsec-3.06.00-noarch-G1802a00000-k250-e1000.tar.bz2

genie_xcross=${fw_directory}/framework/workspace/genie/download/genie_xsec/v3_06_00/NULL/G1802a00000-k250-e1000/data/gxspl-FNALsmall.xml
check_lib_exists ${genie_xcross}

cd ${fw_directory}/framework/workspace/genie/download/genie_xsec/v3_06_00/NULL/G1802a00000-k250-e1000/data
gzip -dk gxspl-NUbig.xml.gz
genie_xcross_big=${fw_directory}/framework/workspace/genie/download/genie_xsec/v3_06_00/NULL/G1802a00000-k250-e1000/data/gxspl-NUbig.xml
check_lib_exists ${genie_xcross_big}

cd ${fw_directory}
