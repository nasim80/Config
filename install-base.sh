#!/bin/bash

cd terminal
. install.sh

cd ../git
. install.sh

cd ../jet_brains
. install.sh

cd ../tmux
. install.sh

cd ../vs_code
. install.sh

echo "All your old config are in the directory ~/.config.old"
