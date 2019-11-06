# -----------------------------------------------------------------
# Exploraci?n del contenido
# -----------------------------------------------------------------
class(iris)  # Clase del objeto
typeof(iris) # Tipo del objeto
str(iris)    # Informaci?n sobre su estructura

summary(iris) # Resumen de contenido
head(iris)  # Primeras filas 
tail(iris)  # ?ltimas filas
# Selecci?n de filas y columnas
iris$Sepal.Length[which(iris$Species == 'versicolor')] 

tmp<-iris

# -----------------------------------------------------------------
# Estad?stica descriptiva
# -----------------------------------------------------------------
unlist(list(
  media = mean(valores), 
  desviacion = sd(valores), 
  varianza = var(valores),
  minimo = min(valores), 
  maximo = max(valores),
  mediana = median(valores),
  rango = range(valores),
  quartiles = quantile(valores)))

mean(iris$Sepal.Length)
lapply(iris[,1:4], mean)
mean(iris$Sepal.Length[which(iris$Species == 'versicolor')])
mean(subset(iris, Species == 'versicolor', select=Sepal.Length)$Sepal.Length)
sapply(unique(iris$Species), function(specie) mean(iris$Sepal.Length[iris$Species == specie]))

getwd()

ebay <- read.csv('eBayAuctions.csv',header=T, sep =";")

ebay <- eBayAuctions

# Hmisc
if(!is.installed('Hmisc'))
  install.packages('Hmisc')
library('Hmisc')
describe(ebay)

# -----------------------------------------------------------------
# Agrupamiento de datos
# -----------------------------------------------------------------
table(iris$Sepal.Length,iris$Species)  # Conteo para cada l?ngitud de sépalo por especie
tail(table(ebay$sellerRating, ebay$currency))  # Los vendedores con mejor reputaci?n operan en d?lares

cortes <- seq(from=4, to=8, by=0.5)
seplen <- cut(iris$Sepal.Length,breaks=cortes)  # Discretizar la longitud de sépalo
table(seplen, iris$Species)  

# split, sample, subset
bySpecies <- split(iris,iris$Species) # Separar en grupos segun un factor
str(bySpecies)
mean(bySpecies$setosa$Sepal.Length)

#str(covertype)  
#subset(covertype, slope > 45 & soil_type == '1', select=c(elevation, slope, class)) # Selecci?n de filas y columnas

#subcovertype <- covertype[sample(1:nrow(covertype), nrow(covertype)*.1),] # Selecci?n aleatoria
#str(subcovertype)

# -----------------------------------------------------------------
# Ordenaci?n de datos
# -----------------------------------------------------------------
sort(valores)
order(valores)
rank(valores)
rank(valores, ties.method='first')
# Ordenar un data frame por una cierta columna
sortedIris <- iris[order(iris$Petal.Length),]
head(sortedIris)

# -----------------------------------------------------------------
# Particionamiento de datos
# -----------------------------------------------------------------

# Primeras n filas para training restantes para test
nTraining <- as.integer(nrow(iris)*.75)
training <- iris[1:nTraining,]
test <- iris[(nTraining+1):nrow(iris),]
nrow(training) + nrow(test) == nrow(iris)

# Otra forma
set.seed(4242)
indices <- sample(1:nrow(iris),nTraining)
particion <- list(training=iris[indices,], test=iris[-indices,])
lapply(particion,nrow)
particion$test

library(Rcmdr)

# Grafico correlacion 

scatterplotMatrix(~Competitive.+Duration+OpenPrice+sellerRating,
                  reg.line=FALSE, smooth=FALSE, spread=FALSE, span=0.5, 
                  ellipse=FALSE, levels=c(.5, .9), id.n=0, diagonal = 
                    'density', data=eBayAuctions)
