# Crear un comentario -----

# Ejemplo de suma
1+1

x <- 1+1
x

is.character(x)

rnorm(100)
help('rnorm')

# -----------------------------------------------------------------
# Acceso a la ayuda
# -----------------------------------------------------------------
help('source') # genera documentacion en archivo html
vignette('grid') # genera documentacion en formato pdf

demo()
demo('graphics')

# -----------------------------------------------------------------
# Ruta de trabajo
# -----------------------------------------------------------------

help(getwd)

getwd()
rutaPrevia <- getwd()
rutaPrevia

setwd('\Users\JuanFernando\OneDrive\Machine Learning\SURA\RSCRIPTS\AYUDA')

getwd()

# Trabajar con los datos y despu?s restablecer la ruta previa
setwd(rutaPrevia)


# -----------------------------------------------------------------
# Guardar y recuperar objetos R
# -----------------------------------------------------------------
rutaPrevia
save(rutaPrevia, file = 'ruta.RData')

# REMOVE
?rm
rm(rutaPrevia)
rutaPrevia

load('ruta.RData')
rutaPrevia


# -----------------------------------------------------------------
# Cargar e instalar paquetes
# -----------------------------------------------------------------
library(Rcmdr)


library(utils)  # El paquete est? disponible, no hay problema

library(openxlsx)  # El paquete no est? disponible
require(openxlsx) 

# Funci?n para verificar si un paquete est? instalado o no
is.installed <- function(paquete) is.element(
  paquete, installed.packages())

# Comprobamos la disponibilidad de un paquete
is.installed('XLConnect')

# Antes de intentar cargar un paquete comprobamos si est? disponible y, si es preciso, lo instalamos
if(!is.installed('sos'))  
  install.packages("sos")
library("sos")

findFn("excel")  # Buscar paquetes en los que aparezca la cadena 'excel'


# Simumlar una distribucion normal

NormalSamples <- as.data.frame(matrix(rnorm(50*1, mean=0, sd=1), ncol=1))
rownames(NormalSamples) <- paste("Fila", 1:50, sep="")
colnames(NormalSamples) <- "obs"

# Graficamos los datos
with(NormalSamples, Hist(obs, scale="frequency", breaks="Sturges",col="darkgray"))

# Resumen numerico de BD
summary(NormalSamples)

# Prueba de normalidad -----
normalityTest(~obs, test="shapiro.test", data=NormalSamples)

