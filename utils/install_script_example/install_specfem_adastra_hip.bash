#!/bin/bash

module load rocm

####### CPU ####### 
fc=ftn
cc=cc
cpp=CC
mpifc=ftn

hip_flag=MI250

###### CRAY MPI ####
mpi_inc=$CRAY_MPICH_DIR/include

# configure to create Makefile
./configure  CXX=$CC CC=$cc FC=$fc MPIFC=$mpifc --with-hip=$hip_flag MPI_INC=$mpi_inc
	     

# make or make all for full applcation with all tools
make 

