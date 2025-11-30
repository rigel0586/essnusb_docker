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

# Geant
mkdir geant4
cd geant4
mkdir build
mkdir install
cd build
cmake -S ${geant4_dir} -B . -DCMAKE_INSTALL_PREFIX=${fw_directory}/geant4/install -DGEANT4_USE_GDML=ON -DGEANT4_USE_QT=ON -DGEANT4_USE_XM=ON -DGEANT4_USE_OPENGL_X11=ON -DXERCESC_ROOT_DIR=${dependencies_dir}/geant4/xerces-c-3.2.5/install
cmake --build . 
cmake --install .

geant4_check_lib=${fw_directory}/geant4/install/lib/libG4clhep.so
check_lib_exists ${geant4_check_lib}

cd ${fw_directory}
