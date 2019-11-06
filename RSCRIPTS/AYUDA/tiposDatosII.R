# -----------------------------------------------------------------
# Data frames: Creaci?n #marcos de datos
# -----------------------------------------------------------------
help(df)

df <- data.frame(Dia=fdias[1:10], #crea una variable llamada df : data.frame crea una hoja de datos
                 Estimado=rep(c(T,F),10), # replica la cadena de los valores T and F
                 Lectura=rnorm(20,5)) # distribucion normal : # de valores - media
df # ejecuta la variable
length(df) # tamaño del vector df
ncol(df) # numero de columnas del vector df
nrow(df) # numero de renglones del vector df

df2 <- data.frame(Dia = numeric(), Estimado = logical(), Lectura = numeric()) # Asigna una clase a cada dato
df2

df3 <- data.frame(Dia = numeric(10), Estimado = logical(10), Lectura = numeric(10)) # crea un df con valores numericos, logicos y numericos
df3


# -----------------------------------------------------------------
# Data frames: Acceso a su contenido
# -----------------------------------------------------------------
df[5,3]  # Tercera columna de la quinta fila
df[5,]   # Quinta fila completa
df[,3]   # Tercera columna completa
df[c(-3,-6),] # Todo menos filas 3 y 6

df$Lectura # Acceso directo a una columna completa Lo muestra en fila
df$Estimado # Acceso directo a una columna

df[df$Estimado==FALSE & df$Dia=='Lun',] # Busca dentro de los datos de una columna que sea == a el valor FALSE y == a LUN

df$Estimado==FALSE


# Obtener el d?a y lectura de todas las filas en las que no se haya estimado
df[df$Estimado==F,c('Dia','Lectura')]  


# Filtrar tambi?n las filas cuya lectura sea <= que 3
df[df$Estimado==F & df$Lectura > 3,c('Dia','Lectura')]  

# -----------------------------------------------------------------
# Data frames: Modificar el contenido
# -----------------------------------------------------------------
df[15,1] <- 'Vie'
df$Dia[15] <- 'Vie'
df

# -----------------------------------------------------------------
# Data frames: Agregar filas y columnas
# -----------------------------------------------------------------
getwd()

# Cuidado, se pierden los tipos de las columnas y todas pasan a ser character
str(df)
save(df, file = 'df.RData')  # Guardamos el data.frame para poder recuperarlo tras el siguiente cambio

df[nrow(df)+1,] <- c('Vie',F,5)  
str(df)

load('df.RData')  # Lo recuperamos

df[nrow(df)+1,] <- data.frame('Vie', F, 5)  
str(df)
tail(df)
head(df)
?head

rbind(df, data.frame(Dia = fdias[1], Estimado = T, Lectura = 3.1415926))
str(df)
tail(df)

nuevaFila <- data.frame(Dia = fdias[1], Estimado = F, Lectura = 4242)
df <- rbind(df[1:9,], nuevaFila, df[10:nrow(df),])
df[8:12,]

df$Ajustado <- df$Lectura + rnorm(nrow(df), 2)
df <- cbind(df, Fecha = date())
head(df)

cbind(df[,c(1,3)], Ajustado = df$Lectura + rnorm(nrow(df),2), df$Estimado)

head(df)

# -----------------------------------------------------------------
# Data frames: Nombres de filas y columnas
# -----------------------------------------------------------------
names(df)   
colnames(df)
rownames(df)

?data.frame

n <- 15
df <- data.frame(Lectura = numeric(n), Fecha = character(n), 
                 stringsAsFactors = FALSE)  
for(idx in 1:n) {
  df$Lectura[idx] <- rnorm(1,10)
  df$Fecha[idx] <- as.character(Sys.Date())
}
head(df)


# -----------------------------------------------------------------
# Listas: Creaci?n y acceso a elementos
# -----------------------------------------------------------------
lst1 <- list(3.1415927, 'Hola', TRUE, fdias[4])
lst2 <- list(fdias[1:10], mes, df)

lst1[[4]]

length(lst1)
lst1

length(lst2)
lst2

lst1[2]   # Una lista con el segundo elemento
lst1[[2]] # El contenido del segundo elemento
lst1[c(2,3)] # Una sublista
lst2[[3]][1] # Un elemento del dato contenido un elemento

# -----------------------------------------------------------------
# Listas: Conversi?n en vectores
# -----------------------------------------------------------------
unlist(lst2)
unlist(lst2, recursive=F)$Fecha

# -----------------------------------------------------------------
# Listas: Uso de nombres
# -----------------------------------------------------------------
names(lst1) <- c('PI','Mensaje','Activado','Inicio')
lst1[[1]]
lst1[['PI']]
lst1$PI

