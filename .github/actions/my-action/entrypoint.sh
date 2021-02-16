#!/bin/sh -l

echo "--------- Show version information of docker container ---------"
cat /etc/os-release
python3 --version
echo "--------- Run test at docker container ---------"
python3 test.py