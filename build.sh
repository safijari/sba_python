#!/bin/bash
cd /repo

rm -r build
rm -r dist

set -e

/opt/python/cp311-cp311/bin/pip install -U auditwheel


for folder in /opt/python/cp3*
do
    echo $folder
    $folder/bin/pip install pybind11-cmake
    $folder/bin/python setup.py bdist_wheel
done

cd dist

for file in ./*
do
    /opt/python/cp311-cp311/bin/auditwheel -v repair --plat manylinux_2_28_x86_64 $file
done