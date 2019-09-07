cmake_minimum_required(VERSION 3.1)
project(sparse_bundle_adjustment)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 11)
endif()

execute_process(COMMAND python -c
                "import pybind11_cmake; print(pybind11_cmake.__path__[0])"
                OUTPUT_VARIABLE pybind11_DIR OUTPUT_STRIP_TRAILING_WHITESPACE)

find_package(pybind11 REQUIRED)
# find_package(Eigen3 REQUIRED) # TODO this should be done corectly
# add_definitions(${EIGEN3_DEFINITIONS})
# include_directories(include ${EIGEN3_INCLUDE_DIRS})

include_directories(include /usr/include/eigen3/)

add_definitions(-DSBA_CHOLMOD)

pybind11_add_module(sba_cpp src/python_interface.cpp src/sba.cpp src/spa.cpp src/spa2d.cpp src/csparse.cpp src/proj.cpp src/node.cpp src/sba_file_io.cpp)
target_link_libraries(sba_cpp PRIVATE blas lapack cholmod cxsparse)
