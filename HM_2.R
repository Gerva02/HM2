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
#we can see that our linear is fairly good; the R^2 is 0.54 
#we also can see that the model is valid the p value of B1 is 3.177e-06, 
#so H0 B1 = 0 is refuted by any reasonable standard 

#we also can figure out that B0 is not as essential as B1 as it's pvalue is only 0.0486 
#so it wouldn't pass an CI(0.01)

plot(residuals(mod) ~ predict.lm(mod))
# no real trend can be established by this graph so let's continue with the analysis



# let's built point-wise CI and PI bands
plot(Elevation ~ Species, data= gala)
abline(mod, col ="red", lty ="dotted") #plotting our linear regression model
new.x <- data.frame(seq(0,400))
colnames(new.x)<- "Species"

new.y.ic <- predict.lm(mod , new.x, interval = "confidence")
new.y.ip <- predict.lm(mod , new.x, interval = "prediction")


matlines(new.x$Species, new.y.ic[,2:3], lty= "dashed" , col = "green")
matlines(new.x$Species, new.y.ip[,2:3], lty= "dashed" , col = "blue")
legend(0,1500 ,  c("IC", "IP"),
       lwd=2,lty= c("dashed","dashed"), col=c("green","blue"), bty="n", cex=1)
# as we expect the IP bands are wider than the IC bands


