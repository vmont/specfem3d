#!/bin/bash

# example of installation script with GPU volta with gun compiler on jean-zay


# load all necessary modules 
module purge 
module load intel-compilers/19.0.4
module load intel-mpi/2019.4
module load cuda/10.2


####### CPU ##################################################################

fc=ifort
cc=icc
mpifc=mpiifort


#####  nvidia GPU #################################################################
# for compiling wih cuda specify the following option with the cuda flag decribed below
#
#   --with-cuda=cuda10
#
#   our options for compiling in differents GPU nvidia architecture :  
#
# cuda10 -> Turing RTX5000, RTX4000, RTX***, also Ampere, A100,
# cuda9  -> Volta V100, 
# cuda8  -> Pascal P100, P*** 
# cuda(5 or 6)  -> Kepler K80 
# cuda5 -> kepler K20, K40  
# 

cuda_flag=cuda9

###########################################################


# configure to create Makefile
./configure CC=$cc FC=$fc MPIFC=$mpifc --with-mpi --with-cuda=$cuda_flag 


# make (only direct solver and basic inversion) or make all full applcation with axisem coupling 
make 

