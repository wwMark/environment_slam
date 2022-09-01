FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y cmake
RUN apt-get install -y libgoogle-glog-dev libgflags-dev
RUN apt-get install -y libatlas-base-dev
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y libsuitesparse-dev
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y g++

RUN cd ~ && mkdir ceres && cd ceres && wget http://ceres-solver.org/ceres-solver-2.1.0.tar.gz && tar zxf ceres-solver-2.1.0.tar.gz && mkdir ceres-bin && cd ceres-bin && cmake ../ceres-solver-2.1.0 && make -j8 && make test && make install

RUN cd ~ && mkdir sophus && cd sophus && echo $PWD && git clone http://github.com/strasdat/Sophus.git && cd Sophus && echo $PWD && mkdir build && cd build && cmake .. && make -j8 && make install
