#Elegí el paquete "poppr" de Populations Genetis in R. Seguí los pasos con mis datos para:
#Chapter 6: Locus stats, heterozygosity, HWE 
#Link: (http://grunwaldlab.github.io/Population_Genetics_in_R/Locus_Stats.html)

#Cargar librerías
library(poppr)
library(adegenet)
library(ade4)
library(magrittr)
library(pegas)
library(ape)
library(lattice)

#Cargar la base de datos. Contiene los genotipos de 10 microsatélites de 699 individuos de 
#Eptesicus serotinus, pertenecientes a 36 poblaciones del Reino Unido y Europa continental.
Eptpop <- read.genalex("Genotipos4.csv", sep= ";")
Eptpop

###Esadísticos de locus y loci filogenéticamente no informativos###

#Para ver si todos los alelos existen en todas las poblaciones de este conjunto de datos
locus_table(Eptpop)

#Ver cuántos loci tenemos
nLoc(Eptpop)
iEptop <- informloci(Eptpop)
nLoc(iEptop)

#Generar los estadísticos multi-locus
poppr(Eptpop)
poppr(iEptop)

###Datos faltantes###
#Evaluar el porcentaje de datos faltantes
info_table(Eptpop, plot= T)

###Equilibrio de Hardy-Weinberg###
#Hacer la prueba con 1000 permutaciones
(Epthwe.full <- hw.test(Eptpop, B = 1000)) #Realiza 1000 permutaciones

#En el paso anterior se tomaron en cuenta todas las poblaciones juntas. Pero si las separamos
(Ept.pop <- seppop(Eptpop) %>% lapply(hw.test, B = 0))

#Y hora tomamos en cuenta sólo la tercera columna con todas las filas
(Epthwe.mat <- sapply(Ept.pop, "[", i = TRUE, j = 3))
alpha  <- 0.05
newmat <- Epthwe.mat
newmat[newmat > alpha] <- 1
levelplot(t(newmat))

#Observamos que todos los loci mostrados en rosa, son loci sospechosos de no estar en HWE con p=< 0.05