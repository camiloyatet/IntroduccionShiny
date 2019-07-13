# Cargue de librerias 
library(GGally)
library(corrplot)
library(broom)

# Cargue de Datos ----

# Desde la URL
data <- read.table('http://www4.stat.ncsu.edu/~stefanski/NSF_Supported/Hidden_Images/einstein_1_files/einstein_man2_bw_Lin_4p_5_flat.txt', header = FALSE)
# Desde el RDS local
data <- readRDS("Diagnosticos de Residuales/RegresionLineal.rds")


### Descriptivos generales de los datos ----
str(data)
summary(data)

## Gráfico pareado de relaciones 
pairs(data, pch=19) # Grafico pareado de variables, paquete base

## Matriz de correlaciones 
M <- cor(data)
corrplot(M, method = "circle")

## Grafico Mixto
ggpairs(data)       # Grafico pareado de variables, paquete GGally

### Ajuste del modelo lineal ----
m1 <- lm(V1 ~ . -1, data = data)
summary(m1)

# Análisis de los coeficientes del modelo
m1_coef <- tidy(m1); m1_coef

### Validacion de Supuestos del Modelo ----
plot(predict(m1), resid(m1), pch = '.')

par(mfrow=c(2,2))
plot(m1)
par(mfrow=c(1,1))

