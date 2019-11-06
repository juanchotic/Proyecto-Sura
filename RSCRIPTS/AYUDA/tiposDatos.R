# -----------------------------------------------------------------
# Tipos de datos simples
# -----------------------------------------------------------------
class(45)
class(34.5)
class("R")
class(TRUE)
class(Inf)
class(1+2i)
class(NaN)

typeof(45)
typeof(34.5)
typeof("R")
typeof(TRUE)
typeof(Inf)
typeof(1+2i)
typeof(NaN)


# -----------------------------------------------------------------
# Asignaci?n de valores a variables
# -----------------------------------------------------------------
a <- 45
a

a = 3.1416
a

"Hola" -> a
a

is.integer(a)
is.character(a)

# -----------------------------------------------------------------
# Variables en el espacio de trabajo
# -----------------------------------------------------------------
ls() # lista las variables que tengo en memoria
rm(a) # borra las variables que tengo en memoria
ls()


# -----------------------------------------------------------------
# Vectores: Creaci?n 
# -----------------------------------------------------------------


diasMes <- c(31,29,31,30,31,30,31,31,30,31,30,31) #crea un vector con una cadena de #s
dias <- c('Lun','Mar','Mi?','Jue','Vie','S?b','Dom') # crea un vector con los dias de la semana

diasMes
dias


# otra forma de crear vectores
            
# -----------------------------------------------------------------
# Vectores: Acceso al contenido
# -----------------------------------------------------------------
length(dias) # TAMAÑO DEL VECTOR "DIAS"
length(semanas) # TAMAÑO DEL VECTOR "SEMANAS"

dias[2]  	# MUESTRA Solo el segundo elemento
dias[-2]	# MUESTRA Todos los elementos menos el segundo
dias[c(3,7)]# MUESTRA Los elementos 3 y 7

length(5) # TAMAÑO DEL VECTOR 5

# -----------------------------------------------------------------
# Vectores: Generaci?n de valores aleatorios
# -----------------------------------------------------------------
set.seed(4242) #semilla fija

?pnorm
help(sd)
help(set.seed)

pnorm(q = -3, mean = 0, sd = 1) # pnorm: probabilidad normal, q: quantil, mean: media
# sd: desviación estandar: que tan separados estan nuestros datos
#Los cuantiles son puntos tomados a intervalos regulares de la función de distribución de una variable aleatoria.
#infinito hacia la izquierda

pnorm(c(-3), mean=0, sd=1, lower.tail=FALSE) #cambia de sentido - FALSE
#lower.tail: cola inferior

x<-rnorm(100, mean=30, sd=10) # distribucion normal
# n: numero de observaciones, media y desviacion estandar 


help(rnorm)

?hist
hist(x) # La función genérica hist calcula un histograma de los valores de datos dados.

#Loteria
#runif: distribución uniforme: genera desviaciones aleatorias entre un rango de numeros
loto <- as.integer(runif(6, min=1, max=49)) # Numeros aleatorios
loto

help(runif)

# Diferencia entre rnorm (distribuci?n normal) y runif (distribuci?n uniforme)
?par

prev <- par(mfrow=c(1,1)) #par: parametros graficos 
hist(rnorm(1000)) # genera un histograma con la distribucion normal
hist(runif(1000)) # genera un histograma con la distribucion uniforme
par(prev)


#r random - numeros aleatorios de una normal de cualquier posicion
#p pnorm - probability - genera una probabilidad: calculo el area respecto a un cuantil
#q qnorm - cual es el cuantil (valor vertical de por encima o debajo de un area)

?rnorm
# -----------------------------------------------------------------
# Vectores: Operar sobre vectores completos
# -----------------------------------------------------------------
vect1 <- rnorm(10) # crea 10 vectores sobre la distribucion normal aleatoria
vect2 <- rnorm(10)


plot(vect1,type='l')

hist(vect1)


# esto no se recomienda a la hora de progamar en R
# preferiblemente no usar for, while, do....
vect3 <- c()
system.time(
  for(idx in 1:length(vect1))
    vect3[idx] <- vect1[idx] * vect1[idx] + vect2[idx]
)

system.time(vect4 <- vect1 * vect1 + vect2)

stopifnot(vect3 == vect4) # Detener el programa si el resultado no es id?ntico


# -----------------------------------------------------------------
# Matrices: Creaci?n de una matriz
# -----------------------------------------------------------------

#Genera columnas y renglones: ncol: columnas nrow: renglones
mes <- matrix(1:35,ncol=7)  # Dos formas de generar exactamente
mes <- matrix(1:35,nrow=5) # la misma matriz
mes

mes <- matrix(1:35,nrow=5,ncol=7,byrow=T)
length(mes)
nrow(mes) # numero de renglones de la variable
ncol # numero de columnas de la variable
dim(mes) #dimension de la variable

# -----------------------------------------------------------------
# Matrices: Conversi?n de un vector en una matriz
# -----------------------------------------------------------------
vect4 # imprime el vector 4
is.matrix(vect4) #pregunta si es una matriz?
dim(vect4) # dimension del vector 4: NULL no hay dimensiones

dim(vect4) <- c(2, 5) # pasa nuestro vector a una matriz con 2 renglones y columnas
is.matrix(vect4) # vuelve y pregunta si es una matrix
dim(vect4) # imprime la dimension de nuestra matriz: 2 renglones y 5 columnas

# -----------------------------------------------------------------
# Matrices: Acceso a los elementos
# -----------------------------------------------------------------
mes[2,]
mes[,2]
mes[2,5]

is.matrix(mes)

for(i in ncol(mes))
{
  for(j in nrow(mes))
  {
    mes[j,i]<--1
  }  
}

mes
# -----------------------------------------------------------------
# Matrices: Nombres de columnas y de filas
# -----------------------------------------------------------------
rownames(mes) <- c('Semana1','Semana2','Semana3','Semana4','Semana5')
colnames(mes) <- dias
mes
attributes(mes)

# Salir o cerrar R
q()


mes[,'Jue']
mes['Semana4',]

# -----------------------------------------------------------------
# Matrices: Otras operaciones
# -----------------------------------------------------------------
fix(mes)
str(mes)

# -----------------------------------------------------------------
# Factors
# -----------------------------------------------------------------
mdias <- c(dias[as.integer(runif(1000,0,7)+1)])
mdias[1:10]
object.size(mdias)

fdias <- factor(mdias)
fdias[1:10]
object.size(fdias)

nlevels(fdias).
levels(fdias)
levels(fdias)[1] <- 'Sun'

peso <- ordered(c('Ligero','Medio','Pesado'))
tam <- peso[c(sample(peso,25,replace=T))]
tam
tam[2] < tam[1]

dias[3]
fdias[3]
as.numeric(fdias[3])
as.numeric(dias[3])


