#HOMEWORK
#-----------------------------------------------------------
# Caricare e descrivere il dataset gala (library faraway).
# Fare una regressione lineare semplice di
# Species (risposta) ed Elevation (esplicativa), commentando il
# summary, costruendo IC e I di previsione
#-----------------------------------------------------------

#loading the right dataset
library("faraway")
data(gala)


#Elevation is our dependent variable , species is our independent variable 
plot(Elevation ~ Species, data= gala)
(mod <- lm(Elevation ~ Species, data= gala))
abline(mod, col ="red", lty ="dotted") #plotting our linear regression model
(sum.mod <- summary(mod))


# let's built point-wise CI and PI bands
new.x <- data.frame(seq(0,400))
colnames(new.x)<- "Species"

new.y.ic <- predict.lm(mod , new.x, interval = "confidence")
new.y.ip <- predict.lm(mod , new.x, interval = "prediction")


matlines(new.x$Species, new.y.ic[,2:3], lty= "dashed" , col = "green")
matlines(new.x$Species, new.y.ip[,2:3], lty= "dashed" , col = "blue")




