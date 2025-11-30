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

# Geant downloads
cd ${framework_dir}
mkdir -p workspace
cd ${framework_dir}/workspace
mkdir -p geant4
cd geant4
mkdir -p download
cd download

curl -O https://geant4-data.web.cern.ch/datasets/G4NDL.4.7.tar.gz
tar -xf G4NDL.4.7.tar.gz

g4ndl47_var=${fw_directory}/framework/workspace/geant4/download/G4NDL4.7/README
check_lib_exists ${g4ndl47_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4EMLOW.8.5.tar.gz
tar -xf G4EMLOW.8.5.tar.gz

G4EMLOW_var=${fw_directory}/framework/workspace/geant4/download/G4EMLOW8.5/README
check_lib_exists ${G4EMLOW_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4PhotonEvaporation.5.7.tar.gz
tar -xf G4PhotonEvaporation.5.7.tar.gz

G4PhotonEvaporation_var=${fw_directory}/framework/workspace/geant4/download/PhotonEvaporation5.7/z1.a3
check_lib_exists ${G4PhotonEvaporation_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4RadioactiveDecay.5.6.tar.gz
tar -xf G4RadioactiveDecay.5.6.tar.gz

G4RadioactiveDecay_var=${fw_directory}/framework/workspace/geant4/download/RadioactiveDecay5.6/README_RDM
check_lib_exists ${G4RadioactiveDecay_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4PARTICLEXS.4.0.tar.gz
tar -xf G4PARTICLEXS.4.0.tar.gz

G4PARTICLEXS_var=${fw_directory}/framework/workspace/geant4/download/G4PARTICLEXS4.0/README
check_lib_exists ${G4PARTICLEXS_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4PII.1.3.tar.gz
tar -xf G4PII.1.3.tar.gz

G4PII_var=${fw_directory}/framework/workspace/geant4/download/G4PII1.3/documentation.pdf
check_lib_exists ${G4PII_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4RealSurface.2.2.tar.gz
tar -xf G4RealSurface.2.2.tar.gz

G4RealSurface_var=${fw_directory}/framework/workspace/geant4/download/RealSurface2.2/README
check_lib_exists ${G4RealSurface_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4SAIDDATA.2.0.tar.gz
tar -xf G4SAIDDATA.2.0.tar.gz

G4SAIDDATA_var=${fw_directory}/framework/workspace/geant4/download/G4SAIDDATA2.0/README_pipiN
check_lib_exists ${G4SAIDDATA_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4ABLA.3.3.tar.gz
tar -xf G4ABLA.3.3.tar.gz

G4ABLA_var=${fw_directory}/framework/workspace/geant4/download/G4ABLA3.3/README
check_lib_exists ${G4ABLA_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4INCL.1.2.tar.gz
tar -xf G4INCL.1.2.tar.gz

G4INCL_var=${fw_directory}/framework/workspace/geant4/download/G4INCL1.2/README
check_lib_exists ${G4INCL_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4ENSDFSTATE.2.3.tar.gz
tar -xf G4ENSDFSTATE.2.3.tar.gz

G4ENSDFSTATE_var=${fw_directory}/framework/workspace/geant4/download/G4ENSDFSTATE2.3/README
check_lib_exists ${G4ENSDFSTATE_var}

curl -O https://geant4-data.web.cern.ch/datasets/G4TENDL.1.4.tar.gz
tar -xf G4TENDL.1.4.tar.gz

G4TENDL_var=${fw_directory}/framework/workspace/geant4/download/G4TENDL1.4/README
check_lib_exists ${G4TENDL_var}

cd ${fw_directory}
