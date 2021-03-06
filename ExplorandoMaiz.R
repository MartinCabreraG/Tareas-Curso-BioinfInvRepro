#Mi script del ejercicio en clase

#1) Cargar el archivo
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

#2) �Qu� tipo de objeto creamos al cargar la base?
class(fullmat)

#3) �C�mo se ven las primeras seis l�neas del archivo?
head(fullmat)

#4) �Cu�ntas muestras hay?
nrow(fullmat)

#5) �De cu�ntos estados se tienen muestras?
length(unique(fullmat$Estado))

#6) �Cu�ntas muestras fueron colectadas antes de 1980?
length(fullmat$A�.o._de_colecta[which(fullmat$A�.o._de_colecta < 1980)])

#7) �Cu�ntas muestras hay de cada raza?
summary(fullmat$Raza)

#8) En promedio, �a qu� altitud fueron colectadas las muestras?
mean(fullmat$Altitud)

#9) �Y a qu� altitud m�xima y m�nima fueron colectadas?
max(fullmat$Altitud)
min(fullmat$Altitud)

#10) Crea una nueva df de datos s�lo con las muestras de la raza Olotillo
df.olotillo<-subset(fullmat, fullmat$Raza == "Olotillo")

#11) Crea una nueva df de datos s�lo con las muestras de la raza Reventador, Jala y Ancho
df.rejaan<-subset(fullmat, Raza=="Reventador"|Raza=="Jala"|Raza=="Ancho")

#12) Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta
write.csv(df.rejaan, file="../meta/submat.csv")

