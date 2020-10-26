#1

#Abrimos la matriz de datos

millas<-datos::millas

?millas
dim(millas) 
names(millas) 
str(millas)
anyNA(millas)
typeof(millas)
View(millas)

millas_13<-as.data.frame(millas)


#2.- Medidas estadísticas descriptivas y de variablidad

summary(millas_13)

install.packages("modeest")
library(modeest)

#Moda

mfv(millas_13$fabricante)
mfv(millas_13$modelo)
mfv(millas_13$cilindrada)
mfv(millas_13$anio)
mfv(millas_13$cilindros)
mfv(millas_13$transmision)
mfv(millas_13$traccion)
mfv(millas_13$ciudad)
mfv(millas_13$autopista)
mfv(millas_13$combustible)
mfv(millas_13$clase)

#Varianza

var(millas_13$cilindrada)
var(millas_13$anio)
var(millas_13$cilindros)
var(millas_13$ciudad)
var(millas_13$autopista)

#Desviación Estandar

sd(millas_13$cilindrada)
sd(millas_13$anio)
sd(millas_13$cilindros)
sd(millas_13$ciudad)
sd(millas_13$autopista)

#Coeficiente de variación

install.packages("FinCal")
library(FinCal)

coefficient.variation(sd=sd(millas_13$cilindrada),
                      avg=mean(millas_13$cilindrada))

coefficient.variation(sd=sd(millas_13$anio),
                      avg=mean(millas_13$anio))

coefficient.variation(sd=sd(millas_13$cilindros),
                      avg=mean(millas_13$cilindros))

coefficient.variation(sd=sd(millas_13$ciudad),
                      avg=mean(millas_13$ciudad))

coefficient.variation(sd=sd(millas_13$autopista),
                      avg=mean(millas_13$autopista))


#3.-Contruir Graficos

#Instalar el paquete tidyverse y abrir libreria

install.packages("tidyverse")
install.packages("RColorBrewer")

library(tidyverse)
library(RColorBrewer)

#Grafico de dispersion

dispersion_13<-ggplot(millas_13, aes(x=cilindrada, y=autopista, color=clase))+
  geom_point()

#Visualizamos

dispersion_13


#Grafico Boxplot

boxplot<-ggplot(millas_13,aes(factor(transmision), 
                             ciudad, fill=transmision))+
  geom_boxplot()+
  ggtitle("Transmision de autos en ciudad")+
  xlab("transmision")+
  ylab("ciudad")

#Visualizamos

boxplot


#Grafica de barras

attach(millas_13)
tabla_cilindros<-table(millas_13$cilindros)

#Visualizamos
tabla_cilindros

color=c("palevioletred1","palevioletred2","palevioletred3","palevioletred4")

barplot(tabla_cilindros,xlab="cilindros", ylab="Frecuencias", 
        main="Gráfico de barras de cilindros", col=color)



