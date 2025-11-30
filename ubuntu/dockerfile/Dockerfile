# Base image containing Python runtime
FROM ubuntu:noble


# Set the working directory inside the container
WORKDIR /essnusb

RUN apt-get -y update

#install prerequisites
RUN apt-get -y install cmake
RUN apt-get -y install git
RUN apt-get -y install repo
RUN apt-get -y install sudo

#install packages
RUN apt-get -y install dpkg-dev g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev libssl-dev cmake fastlink gfortran 
RUN apt-get -y install libtool automake autoconf autotools-dev  python3 build-essential libxmu-dev libxi-dev libgl-dev binutils libglu1-mesa freeglut3-dev

RUN apt-get -y install dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev libssl-dev gfortran libpcre3-dev 
RUN apt-get -y install xlibmesa-glu-dev libglew-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev 
RUN apt-get -y install libldap2-dev libxml2-dev libkrb5-dev libgsl0-dev qtwebengine5-dev

RUN apt-get -y install protobuf-compiler python3-dev python3-numpy subversion doxygen clang-format curl libmotif-dev qttools5-dev

RUN apt-get -y install libtbb-dev libvdt-dev libgif-dev

RUN apt-get -y install libglu1-mesa-dev libgraphviz-dev libgsl-dev  nlohmann-json3-dev libgl2ps-dev liblzma-dev libxxhash-dev liblz4-dev libzstd-dev

RUN apt-get -y install qt3d5-dev qt3d5-examples qt3d5-doc libxmuu-dev 

RUN apt-get -y install libnsl-dev libnsl2

RUN apt-get -y install libreadline-dev libbz2-dev libsqlite3-dev libffi-dev

#retrieve repository
RUN repo init -u https://github.com/rigel0586/essnusb_v3.git -m default.xml
RUN repo sync

# build third party dependencies
WORKDIR /essnusb/third_party/dependencies/geant4
COPY ./build_third_party_geant4.sh /essnusb/third_party/dependencies/geant4/build_third_party_geant4.sh
RUN sh build_third_party_geant4.sh

WORKDIR /essnusb/third_party/dependencies/genie
COPY ./build_third_party_genie.sh /essnusb/third_party/dependencies/genie/build_third_party_genie.sh
RUN sh build_third_party_genie.sh

WORKDIR /essnusb/third_party/dependencies/root
COPY ./build_third_party_root.sh /essnusb/third_party/dependencies/root/build_third_party_root.sh
RUN sh build_third_party_root.sh

# build framework with custom script
WORKDIR /essnusb/fw/essnusb_v3_fw

COPY ./build_essnusb_cern_root.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_cern_root.sh
COPY ./build_essnusb_gtest.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_gtest.sh
COPY ./build_essnusb_geant.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_geant.sh
COPY ./build_essnusb_geant_downloads.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_geant_downloads.sh
COPY ./build_essnusb_vgm.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_vgm.sh
COPY ./build_essnusb_genfit.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_genfit.sh
COPY ./build_essnusb_genie.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_genie.sh
COPY ./build_essnusb_copy_third_party.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_copy_third_party.sh
COPY ./build_essnusb_fairlogger.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_fairlogger.sh
COPY ./build_essnusb_pathfinder.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_pathfinder.sh
COPY ./build_essnusb_framework.sh /essnusb/fw/essnusb_v3_fw/build_essnusb_framework.sh

RUN sh build_essnusb_cern_root.sh
RUN sh build_essnusb_gtest.sh
RUN sh build_essnusb_geant.sh
RUN sh build_essnusb_geant_downloads.sh
RUN sh build_essnusb_vgm.sh
RUN sh build_essnusb_genfit.sh
RUN sh build_essnusb_genie.sh
RUN sh build_essnusb_copy_third_party.sh
RUN sh build_essnusb_fairlogger.sh
RUN sh build_essnusb_pathfinder.sh
RUN sh build_essnusb_framework.sh

