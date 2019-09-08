#!/bin/bash
/opt/python/cp27-cp27mu/bin/pip install pybind11_cmake
/opt/python/cp37-cp37m/bin/pip install pybind11_cmake
/opt/python/cp37-cp37m/bin/pip install -U auditwheel

rm /usr/bin/python
ln -s /opt/python/cp37-cp37m/bin/python /usr/bin/python

cd /repo

rm -r build
rm -r dist
# mkdir build
# cd build
# cmake ..
# make

for folder in /opt/python/*
do
    $folder/bin/python setup.py bdist_wheel
cd dist
for file in ./*
do
    /opt/python/cp37-cp37m/bin/auditwheel repair --plat manylinux2010_x86_64 $file
done
