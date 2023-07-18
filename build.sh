#!/bin/bash

cd /repo

rm -r build
rm -r dist

cd /repo && /opt/python/cp37-cp37m/bin/pip install pybind11 pybind11-cmake && /opt/python/cp37-cp37m/bin/python setup.py bdist_wheel
cd /repo && /opt/python/cp311-cp311/bin/pip install pybind11 pybind11-cmake && /opt/python/cp311-cp311/bin/python setup.py bdist_wheel

cd dist

for file in ./*
do
    auditwheel repair $file
done
