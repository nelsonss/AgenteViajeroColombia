######################################################################
# Universidad Jorge Tadeo Lozano - Central
# Maestria en Modelado y Simulacion
######################################################################
rm(list = ls())

# Nelson, puede cambiar este directorio

setwd("C://Proyectos//Maestria_Modelado//Simulacion Estocastica 2//Recocido")

D <- read.csv("DistmaciasEntreCiudades.csv",header=T, sep = ",")

view(D)