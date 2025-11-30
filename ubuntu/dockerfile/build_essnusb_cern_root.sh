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

# Cern root
mkdir cern_root
cd cern_root
mkdir build
mkdir install
cd build
pythia6_inc=${dependencies_dir}/genie/pythia6/v6_428/inc/
pythia6_lib=${dependencies_dir}/genie/pythia6/v6_428/lib/libPythia6.so
cmake -S ${root_dir} -B . -DCMAKE_INSTALL_PREFIX=${fw_directory}/cern_root/install -Dmathmore=ON -Dtmva-sofie=ON -Dopengl=ON -Dpythia6=pythia6 -DPYTHIA6_INCLUDE_DIR=${pythia6_inc} -DPYTHIA6_LIBRARY=${pythia6_lib} -Dbuiltin_vdt=ON
cmake --build . 
cmake --install .

root_check_lib=${fw_directory}/cern_root/install/lib/libCling.so
check_lib_exists ${root_check_lib}

# Mathmore is required for Genie
root_mathmore_check_lib=${fw_directory}/cern_root/install/lib/libMathMore.so
check_lib_exists ${root_mathmore_check_lib}

cd ${fw_directory}
