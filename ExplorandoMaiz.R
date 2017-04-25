#Mi script del ejercicio en clase

#1) Cargar el archivo
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

#2) ¿Qué tipo de objeto creamos al cargar la base?
class(fullmat)

#3) ¿Cómo se ven las primeras seis líneas del archivo?
head(fullmat)

#4) ¿Cuántas muestras hay?
nrow(fullmat)

#5) ¿De cuántos estados se tienen muestras?
length(unique(fullmat$Estado))

#6) ¿Cuántas muestras fueron colectadas antes de 1980?
length(fullmat$AÌ.o._de_colecta[which(fullmat$AÌ.o._de_colecta < 1980)])

#7) ¿Cuántas muestras hay de cada raza?
summary(fullmat$Raza)

#8) En promedio, ¿a qué altitud fueron colectadas las muestras?
mean(fullmat$Altitud)

#9) ¿Y a qué altitud máxima y mínima fueron colectadas?
max(fullmat$Altitud)
min(fullmat$Altitud)

#10) Crea una nueva df de datos sólo con las muestras de la raza Olotillo
df.olotillo<-subset(fullmat, fullmat$Raza == "Olotillo")

#11) Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
df.rejaan<-subset(fullmat, Raza=="Reventador"|Raza=="Jala"|Raza=="Ancho")

#12) Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta
write.csv(df.rejaan, file="../meta/submat.csv")

