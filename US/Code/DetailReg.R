##### Data Input and Library #####
library(MASS)
library(rms)
library(ggplot2)
library(plyr)
library(scales)
library(corrgram)

rm(list=ls())    #remove all datasets
setwd("C:/Users/Xgao/Documents/GitHub/Performance/US/Data")    #set path
R <- read.csv("ReviewRegDetail.csv", header = T)
Rs <- read.csv("ReviewRegDetailS.csv", header = T)

Rreg <- R[,-1]
Rregs <- Rs[,-1]

Y <- cbind(Rreg$Review)
X <- cbind(Rreg$J,Rreg$R,Rreg$C,Rreg$P,Rreg$I,Rreg$H)
Xvar <- c("J","R","C","P","I","H")
colnames(X) <- Xvar
table(Y)
summary(X)

ddist <- datadist(Xvar)
options(datadist = 'ddist')
ologit <- lrm(Y ~ X, data=Rreg)
print(ologit)

fit <- lm(Y~X) 
summary(fit)
par(mfrow=c(2,2))
plot(fit)

Ys <- cbind(Rregs$Review)
Xs <- cbind(Rregs$J,Rregs$R,Rregs$C,Rregs$P,Rregs$I,Rregs$H,Rregs$S)
Xsvar <- c("J","R","C","P","I","H","S")
colnames(Xs) <- Xsvar
table(Ys)
summary(Xs)

ddist <- datadist(Xsvar)
options(datadist = 'ddist')
# mulit col?
# ologits <- lrm(Ys ~ Xs, data=Rregs)
# print(ologits)

fits <- lm(Ys~Xs) 
summary(fits)
par(mfrow=c(2,2))
plot(fits)
