#!/bin/bash

sudo mongod --bind_ip_all &
python3 /home/ubuntu/annotation_tools/run.py --port 8008 --host 0.0.0.0 

