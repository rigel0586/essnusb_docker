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

# Genie
mkdir genie
cd genie
mkdir build
mkdir install
cd build
cp -R ${genie_dir} .
cd genie

export GENIE=${fw_directory}/genie/build/genie
export ROOTSYS=${fw_directory}/cern_root/install
export PATH=$PATH:${fw_directory}/cern_root/install/bin
export PYTHIA6=${dependencies_dir}/genie/pythia6/v6_428/lib/
export LHAPDF5_INC=${dependencies_dir}/genie/lhapdf-5.9.1/install/include/
export LHAPDF5_LIB=${dependencies_dir}/genie/lhapdf-5.9.1/install/lib/ 
export LHAPDF6_INC=${dependencies_dir}/genie/LHAPDF-6.5.4/install/include/
export LHAPDF6_LIB=${dependencies_dir}/genie/LHAPDF-6.5.4/install/lib/ 
export GEANT4_INC=${fw_directory}/geant4/install/include/
export GEANT4_LIB=${fw_directory}/geant4/install/lib/ 

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${fw_directory}/geant4/install/lib/:${dependencies_dir}/genie/lhapdf-5.9.1/install/lib/:${dependencies_dir}/genie/log4cpp/install/lib/:${dependencies_dir}/geant4/2.4.6.4/install/lib/:${dependencies_dir}/genie/log4cpp/install/lib/

./configure --prefix=${fw_directory}/genie/install \
--disable-profiler \
--disable-validation-tools \
--disable-cernlib \
--enable-lhapdf \
--enable-flux-drivers \
--enable-geom-drivers \
--disable-doxygen \
--enable-test \
--enable-mueloss \
--enable-dylibversion \
--enable-t2k \
--enable-fnal \
--enable-atmo \
--enable-geant4 \
--enable-nucleon-decay \
--disable-masterclass \
--disable-debug \
--with-optimiz-level=O2 \
--with-pythia6-lib=${dependencies_dir}/genie/pythia6/v6_428/lib/  \
--with-log4cpp-inc=${dependencies_dir}/genie/log4cpp/install/include/  \
--with-log4cpp-lib=${dependencies_dir}/genie/log4cpp/install/lib/  \
--lhapdf5-inc=${dependencies_dir}/genie/lhapdf-5.9.1/install/include/  \
--lhapdf5-lib=${dependencies_dir}/genie/lhapdf-5.9.1/install/lib/ \
--geant4-inc=${fw_directory}/geant4/install/include/ \
--geant4-lib=${fw_directory}/geant4/install/lib/ \

gmake
gmake install

genielib=${fw_directory}/genie/install/lib/libGFwAlg.so
check_lib_exists ${genielib}

cd ${fw_directory}
