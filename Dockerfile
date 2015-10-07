FROM ubuntu:latest
MAINTAINER Rodrigo Cosme <rdccosmo@gmail.com>

RUN apt-get update -y && \
    apt-get install -y \
    gfortran gfortran-4.6-multilib csh build-essential libcloog-ppl1 m4 wget ncl-ncarg 

RUN mkdir /home/wrf && \
    useradd wrf -d /home/wrf && \
    chown -R wrf:wrf /home/wrf

USER wrf
ENV HOME /home/wrf

RUN mkdir $HOME/Build_WRF 
RUN mkdir $HOME/Build_WRF/LIBRARIES

ENV PREFIX $HOME/Build_WRF
ENV DEBIAN_FRONTEND noninteractive

ENV BUILDDIR $HOME/Build_WRF

ENV DIR $HOME/Build_WRF/LIBRARIES
WORKDIR $DIR

ENV CC gcc

ENV CXX g++

ENV FC gfortran

ENV FCFLAGS -m64

ENV F77 gfortran

ENV FFLAGS -m64

