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

root_dir=root

gsl=gsl-latest.tar.gz
gsl_dir=${dependency_dir}/${root_dir}/gsl-2.7.1


# gsl-2.7.1
cd ${dependency_dir}/${root_dir}
tar -xf ${gsl}
cd ${gsl_dir}
mkdir install
./configure --prefix=${gsl_dir}/install
make 
make install
gsllib=${gsl_dir}/install/lib/libgsl.so
check_lib_exists ${gsllib}








