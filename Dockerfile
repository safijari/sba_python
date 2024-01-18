FROM safijari/manylinux_2_28-x64

RUN yum install openblas-devel -y

RUN yum install lapack-devel -y

RUN yum install suitesparse-devel -y

RUN yum install qt5-qtbase-devel -y

RUN yum install freeglut-devel -y

RUN yum install mesa-libOSMesa-devel -y