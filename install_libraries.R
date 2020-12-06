#make sure the right path shows up here (/opt/microsoft/ropen/3.5.1/lib64/R/library
.libPaths()

#record all libaries we installed
install.packages("optparse") # parse command line arguments

####################################
# test installed libraries
###################################
library(optparse)
