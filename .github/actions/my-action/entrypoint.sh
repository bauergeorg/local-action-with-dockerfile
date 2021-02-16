#!/bin/sh -l

echo "--------- Print Version ---------"
python3 --version
cat /etc/os-release
echo "--------- Run Test ---------"
python3 test.py