mu0<-c(0,0)
sigma0<-matrix(c(1.2,0.23,0.23,1.4),2,2)
mu1<-c(2,3)
sigma1 <- matrix(c(10,3.3,3.3,2),2,2)
alpha<-c(1,1,1)
n<-10^3

library(MASS)
library(ggplot2)
library(plotly)
gibb1<-gendata(mu0,mu1,sigma0,sigma1,alpha,n) # generated data from gibbs sampling
l<-pdfplot(mu0,mu1,sigma0,sigma1,alpha,n) # plots of gibb sampling 
l
k<-conplot(mu0,mu1,sigma0,sigma1,alpha,n) # supremepose the conditional 
k$`R=0`
k$`R=1`

# fit the theoratical conditional distributions
yr1 = mvrnorm(n,mu1,sigma1)
k<-kde2d(yr1[,1],yr1[,2],n=1000)
image(k,xlab = "y1",ylab="y2"); contour(k, add = T)
title("Contour plot for R=1")

yr0 = mvrnorm(n,mu1,sigma0)
k<-kde2d(yr0[,1],yr0[,2],n=50)
image(k,xlab = "y1",ylab="y2"); contour(k, add = T)
title("Contour plot for R=1")

library(KernSmooth)
est <- bkde2D(yr1, bandwidth=c(0.7, 7)) 
contour(est$x1, est$x2, est$fhat)
#Image plot of surface with nice, smooth  contours and shading

surface(fit, type="C", nx=128, ny=128) 
