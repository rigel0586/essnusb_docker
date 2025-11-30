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


cd ..
dependency_dir=${PWD}
cd ..
base_directory=${PWD}

# Set third party name dirs
geant4_dir=geant4

geant4_clhep=clhep-2.4.6.4.tgz
geant4_clhep_dir=${dependency_dir}/${geant4_dir}/2.4.6.4

geant4_expat=expat-2.6.4.tar.gz
geant4_expat_dir=${dependency_dir}/${geant4_dir}/expat-2.6.4

geant4_zlib=zlib-1.2.13.tar.gz
geant4_zlib_dir=${dependency_dir}/${geant4_dir}/zlib-1.2.13

geant4_xerces=xerces-c-3.2.5.tar.gz
geant4_xerces_dir=${dependency_dir}/${geant4_dir}/xerces-c-3.2.5


cd ${dependency_dir}/${geant4_dir}

echo "Exctracting and installing dependencies for geant4 in directory [ ${PWD} ]"

# clhep
tar -xvzf ${geant4_clhep}
cd ${geant4_clhep_dir}
mkdir build
mkdir install
cd build
cmake -S ${geant4_clhep_dir}/CLHEP -B . -DCMAKE_INSTALL_PREFIX=${geant4_clhep_dir}/install
cmake --build .
cmake --install .

clhep_lib=${geant4_clhep_dir}/install/lib/libCLHEP-2.4.6.4.so
check_lib_exists ${clhep_lib}

# expat
cd ${dependency_dir}/${geant4_dir}
tar -xf ${geant4_expat}
cd ${geant4_expat_dir}
mkdir build
mkdir install
cd build
cmake -S ${geant4_expat_dir} -B . -DCMAKE_INSTALL_PREFIX=${geant4_expat_dir}/install
cmake --build .
cmake --install .

expat_lib=${geant4_expat_dir}/install/lib/libexpat.so
check_lib_exists ${expat_lib}

# zlib
cd ${dependency_dir}/${geant4_dir}
tar -xf ${geant4_zlib}
cd ${geant4_zlib_dir}
mkdir build
mkdir install
cd build
cmake -S ${geant4_zlib_dir} -B . -DCMAKE_INSTALL_PREFIX=${geant4_zlib_dir}/install
cmake --build .
cmake --install .

zlib_lib=${geant4_zlib_dir}/install/lib/libz.so
check_lib_exists ${zlib_lib}

# xerces
cd ${dependency_dir}/${geant4_dir}
tar -xf ${geant4_xerces}
cd ${geant4_xerces_dir}
mkdir build
mkdir install
cd build
cmake -S ${geant4_xerces_dir} -B . -DCMAKE_INSTALL_PREFIX=${geant4_xerces_dir}/install
cmake --build .
cmake --install .

xerces_lib=${geant4_xerces_dir}/install/lib/libxerces-c-3.2.so
check_lib_exists ${xerces_lib}
