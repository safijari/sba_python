from setuptools import setup, find_packages
try:
    import pybind11_cmake
except ImportError:
    print("pybind11-cmake must be installed."
          "Try \n \t pip install pybind11_cmake")
    import sys
    sys.exit()

from pybind11_cmake import CMakeExtension, CMakeBuild

setup(
    name='sparse_bundle_adjustment',
    version='0.9.1',
    author='',
    author_email='',
    description='',
    long_description='',
    packages=find_packages(),
    setup_requires=['pybind11_cmake'],
    ext_modules=[CMakeExtension('sba_cpp')],
    cmdclass=dict(build_ext=CMakeBuild),
    zip_safe=False,
)
