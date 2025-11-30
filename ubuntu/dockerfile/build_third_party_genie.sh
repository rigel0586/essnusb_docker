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

genie_dir=genie

genie_lhapdf5=lhapdf-5.9.1.tar.gz
genie_lhapdf6=LHAPDF-6.5.4.tar.gz
genie_log4cpp=log4cpp-1.1.4.tar.gz

genie_lhapdf5_dir=${dependency_dir}/${genie_dir}/lhapdf-5.9.1
genie_lhapdf6_dir=${dependency_dir}/${genie_dir}/LHAPDF-6.5.4
genie_log4cpp_dir=${dependency_dir}/${genie_dir}/log4cpp
genie_pythia6_dir=${dependency_dir}/${genie_dir}/pythia6

# backup python link
#sudo cp /usr/bin/python /usr/bin/python_up

cd ${dependency_dir}
cd ..

# Set python env
third_party_dir=$base_directory
export PYENV_ROOT=$third_party_dir/pyenv
export PATH=$PATH:$third_party_dir/pyenv/bin

pyenv install -f 2.7.18
pyenv install -f 3.12.9

export BACK_UP_PATH=$PATH
export PATH=$BACK_UP_PATH:$PYENV_ROOT/versions/2.7.18/bin

# lhapdf5
cd ${dependency_dir}/${genie_dir}
tar -xf ${genie_lhapdf5}
cd ${genie_lhapdf5_dir}
mkdir build
mkdir install
export PATH=$BACK_UP_PATH:$PYENV_ROOT/versions/2.7.18/bin
export FCFLAGS=-std=legacy
./configure --prefix=${genie_lhapdf5_dir}/install
gmake 
gmake install
lhapdf5lib=${genie_lhapdf5_dir}/install/lib/libLHAPDF.so
check_lib_exists ${lhapdf5lib}

# lhapdf6
cd ${dependency_dir}/${genie_dir}
tar -xf ${genie_lhapdf6}
cd ${genie_lhapdf6_dir}
mkdir build
mkdir install
export PATH=$BACK_UP_PATH:$PYENV_ROOT/versions/3.12.9/bin
./configure --prefix=${genie_lhapdf6_dir}/install
gmake 
gmake install
lhapdf6lib=${genie_lhapdf6_dir}/install/lib/libLHAPDF.so
check_lib_exists ${lhapdf6lib}

export PATH=$BACK_UP_PATH

# log4cpp
cd ${dependency_dir}/${genie_dir}
tar -xf ${genie_log4cpp}
cd ${genie_log4cpp_dir}
mkdir build
mkdir install
cd build
cmake -S ${genie_log4cpp_dir} -B . -DCMAKE_INSTALL_PREFIX=${genie_log4cpp_dir}/install
cmake --build .
cmake --install .
cd ${genie_log4cpp_dir}
./configure --prefix=${genie_log4cpp_dir}/install
gmake 
gmake install
log4cpplib=${genie_log4cpp_dir}/install/lib/liblog4cpp.a
check_lib_exists ${log4cpplib}
log4cppsolib=${genie_log4cpp_dir}/install/lib/liblog4cpp.so
check_lib_exists ${log4cppsolib}

# pythia6
cd ${genie_pythia6_dir}
./build_pythia6.sh
pythia6lib=${genie_pythia6_dir}/v6_428/lib/libPythia6.so
check_lib_exists ${pythia6lib}







