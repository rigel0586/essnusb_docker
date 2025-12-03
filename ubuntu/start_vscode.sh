#!/bin/bash

current_folder=${PWD}
mkdir -p ${current_folder}/vs_workspace
sudo code --no-sandbox --user-data-dir=${current_folder}/vs_workspace
