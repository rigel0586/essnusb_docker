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

# PathFinder
export PATH=$PATH:${fw_directory}/cern_root/install/bin #PathFinder requires CERN ROOT
mkdir pathfinder
cd pathfinder
mkdir build
mkdir install
cd build
cmake -S ${pathfinder_dir} -B . -DCMAKE_INSTALL_PREFIX=${fw_directory}/pathfinder/install
cmake --build . 
cmake --install .

pathfinder_lib=${fw_directory}/pathfinder/install/lib/libPathFinder.so
check_lib_exists ${pathfinder_lib}

cd ${fw_directory}
