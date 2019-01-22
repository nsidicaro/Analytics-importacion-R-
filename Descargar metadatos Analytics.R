#Install Library
install.packages("googleAnalyticsR",dependencies=TRUE, repos='http://cran.rstudio.com/')
#Abrir libreria 
library(googleAnalyticsR)
library(purrr)
library(tidyr)
library(dplyr)
####En el caso de no tener una de las librerias instaladas solo tienen que poner el nombre entre " " en el primer codigo para bajarlo
#Autorizar R a extraer data de Analytics
ga_auth() #Con esto se abre una pestaña en para autorizar el paquete

#Una vez que se tiene acceso se puede bajar la informacion de forma sencilla y rapida
Numeros.cuenta <- ga_account_list() %>%
  select(accountId,accountName,webPropertyId,viewId,viewName)

#Para tener una lista de filtros de la cuenta
Filtros.lista <- ga_filter_list("XXXXXX")

#Para obtener los filtros de una vista específica
Filtros.lista.vista <- ga_filter_view_list("XXXXXX","XXXXXXXX","XXXXXX")

#Para obtener los objetivos de una vista
Objetivos.lista.vista <- ga_goal_list("XXXXXXX","XXXXXXXXXXX","XXXXXXXXXX")
###Si se quiere tener esta informacion mas ordenada correr lo siguiente: 
###Esto sirve para los objetivos de eventos.
Objetivos_DF <- Objetivos.lista.vista$items
Construccion.objetivos_DF <- Objetivos.lista.vista$items$eventDetails$eventConditions
#Si se quieren ver los objetivos rapido a ver como estan construidos se puede con el siguiente codigo
Configuracion.objetivos <- NULL
i <- 1
  for(i in 1:length(Construccion.objetivos_DF)){
    objetivos1 <- cbind(Construccion.objetivos_DF[[i]][["type"]],Construccion.objetivos_DF[[i]][["matchType"]],Construccion.objetivos_DF[[i]][["expression"]],Objetivo=i)
    Objetivos <- data.frame(objetivos1) 
    Configuracion.objetivos <- rbind(Configuracion.objetivos,Objetivos)
  }
Configuracion.objetivos <- Configuracion.objetivos %>%
  select(Objetivo,Event.type=V1,Match.type=V2,Expression=V3)
rm(objetivos1)
rm(Objetivos)
rm(i)

#Segmentos que tiene la cuenta
segmentos <- ga_segment_list()
segmentos_DF <- segmentos$items #Solos nos quedamos con las caracteristicas de cada segmento
segmentos_DF <- segmentos_DF %>%
  select(segmentId,name,definition,type,created,updated) #Con esto nos quedamos con las caracteristicas importantes del dataframe
segmentos_creados_DF <- segmentos_DF %>%
  filter(type=="CUSTOM") #Con esto se filtra por los segmentos creados


