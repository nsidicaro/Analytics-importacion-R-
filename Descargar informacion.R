#install devtools package for downloading packages from github
install.packages("devtools",dependencies=TRUE, repos='http://cran.rstudio.com/')

#install curl for easier use
install.packages("curl",dependencies=TRUE, repos='http://cran.rstudio.com/')
#installing rga package from github
install.packages("RCurl",dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages("googleAnalyticsR",dependencies=TRUE, repos='http://cran.rstudio.com/')
install_github("skardhamar/rga")


#Librerias 
library(curl)
library(devtools)
library(rga)
library(googleAnalyticsR)
library(tidyverse)

#Acceso a Analytics. 
rga.open(instance = "ga") #Para que funcione hay que tener Analytics abierto

#Para probar si el acceso esta bien
id <- "XXXXXXXXX" #Corresponde a la vista de la que quieras sacar los datos. La vista se puede extraer desde el link en la parte que viene despues de la p
ga$getData(id) #Esto debería mostrar los ultimos siete dias de las siguientes metricas: 
#users, sessiones y pageviews

#Una vez que funciona se puede seguir extrayendo cosas. 
gaData <- ga$getData(id, start.date = as.Date("2018-09-01"), 
                     end.date=as.Date("2018-09-18"), metrics = "ga:pageviews,ga:entrances",
                     dimensions = "ga:date", filter = "ga:country=~Argentina;ga:medium==organic",
                     sort = "-ga:pageviews", start = 1,segment = "gaid::sxgP2x-hTbC-bRqmvpafrg")

#Los parametros sirven para lo siguiente: 
#### "id" es la vista de la que se obtiene la informacion. Tiene que estar autorizada previamente
#### "start.date" y "end.date" son el periodo en el que va a buscar los datos. Tiene que tener la funcion as.Date antes para que reconozca que es una fecha
#### metrics refiere claramente a las metricas. Para obtener mas de una todas deben estar encadenadas por una coma (",") para que reconozca que son varias metricas. Todas deben situarse dentro del mismo " ". 
#### Mismas indicaciones que en las metricas para las dimensiones
#### filter es para agregar filtros. Tienen que estar separados por ";" a diferencia de las metricas y dimensiones
#### sort sirve para ordenar la informacion. Puede estar ordenada por varios criterios. 
#### start es para indicar cuantos datos de las fechas elegidas te tira. Los datos van a estar ordenados segun el sort que hayan elegido
#### segment necesita el Google Analytics ID del segmento elegido para utilizarlo. Esto se puede hacer desde la siguiente pagina: http://ga-dev-tools.appspot.com/explorer/ o con un codigo que estara mas abajo


#Codigo para conseguir segment ID 
install_github("artemklevtsov/RGA")
library(RGA)
segmentos <- list_segments()
