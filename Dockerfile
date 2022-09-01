FROM ubuntu:20.04

RUN apt-get install cmake
RUN apt-get install libgoogle-glog-dev libgflags-dev
RUN apt-get install libatlas-base-dev
RUN apt-get install libeigen3-dev
RUN apt-get install libsuitesparse-dev

RUN cd ~
RUN mkdir ceres
RUN cd ceres
RUN git clone https://ceres-solver.googlesource.com/ceres-solver
RUN tar zxf ceres-solver-2.1.0.tar.gz
RUN mkdir ceres-bin
RUN cd ceres-bin
RUN cmake ../ceres-solver-2.1.0
RUN make -j8
RUN make test
RUN make install
RUN bin/simple_bundle_adjuster ../ceres-solver-2.1.0/data/problem-16-22106-pre.txt

RUN cd ~
RUN mkdir sophus
RUN cd sophus
RUN git clone http://github.com/strasdat/Sophus.git
RUN mkdir build
RUN cd build
RUN cmake ..
RUN make -j8
RUN make install
