#lIBRERIAS NECESARIAS
library(readr)


#RUTAS DE TRABAJO  # REEMPLAZAR
dir.raiz       <-  'C:/Users/Openlab2/Downloads/SURA/'
dir.funciones  <-  'C:/Users/Openlab2/Downloads/SURA/RSCRIPTS/'
dir.input      <-  'C:/Users/Openlab2/Downloads/SURA/DATA/INPUT/'
dir.output     <-  'C:/Users/Openlab2/Downloads/SURA/DATA/OUTPUT/'


# LECTURA DE DATOS

paste0('dir.input, Prediccion_ERC_Data') # Nos va a concatenar dos rutas


#Versión 1.0: revisar
Data <- read_delim(paste0(dir.input, 'Prediccion_ERC_Data.txt'), 
                                  "|", escape_double = FALSE, trim_ws = TRUE, locale=locale())


#version 1.1: ok
Data <- read.table(paste0(dir.input, 'Prediccion_ERC_Data.txt'), 
                   header = TRUE, #ENCABEZADO: MUESTRA EL NOMBRE DE LAS VARIABLES DEL DOCUMENTO
                   sep = "|", # SEPARA LOS DATOS DEL ARCHIVO TXT
                   dec = '.', # OPERADOR DECIMAL POR UN PUNTO
                   na.strings = "?") # REEMPLAZA LOS DATOS QUE TENGAN ? POR NA's (equivalente a un dato faltante)

#Analisis exploratorio

View(Data) # ejecuta la tabla de datos
summary(Data) # saca un resumen númerico de toda la base de datos
