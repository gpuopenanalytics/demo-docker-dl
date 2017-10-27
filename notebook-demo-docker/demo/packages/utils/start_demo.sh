#!/bin/bash
set -e
cd ~/utils

# start mapd
echo "Start MAPD"
cmd="nohup ./start_mapd.sh"
$cmd &disown

echo "Wait for mapd to start"
sleep 10

# load data
echo "Create mapd tables and import csv data"
bash ./create_mapd_tables.sh
