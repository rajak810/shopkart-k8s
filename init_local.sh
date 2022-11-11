#!/bin/bash

# create virtual env
## sudo apt install python3.10-venv
python3 -m venv env

# activate the virtualEnv
source env/bin/activate

# install requirements
pip3 install -r requirements.txt