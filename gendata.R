gendata<-function(mu0,mu1,sigma0,sigma1,alpha,n){
  library(MASS)
  # f(y/r=1) ~ N(mu0,sigma1)
  # f(y/r=0) ~ N(mu1,sigma0)
  r0<-1 #intial r value
  y0<-mvrnorm(1,mu1,sigma1) # intial value of y
  y<-matrix(numeric(),n+1,2,byrow=F) # matrix to store y's
  r<-numeric(n+1) # matrix to store R's
  y[1,]<-y0
  r[1]<-r0 
  #alpha<-c(alpha0,alpha1,alpha2)
  for(i in 1:n){
    piy<-exp(alpha%*%c(1,y[i,]))/(1+exp(alpha%*%c(1,y[i,]))) # pi(y)
    r[i+1]<-rbinom(1,1,piy)
    
    if (r[i+1]==0){
      y[i+1,]<-mvrnorm(n=1,mu0,sigma0)
    }else{
      y[i+1,]<-mvrnorm(n=1,mu1,sigma1)
    }
  }
  m<-(n/10)
  r<-r[-c(1:m+1)]
  y<-y[-c(1:m),]
  table<-cbind(y,r)
  fyr0<-subset(table,table[,3]==0)
  fyr1<-subset(table,table[,3]==1)
  exp0<-colMeans(fyr0[,1:2])
  exp1<-colMeans(fyr1[,1:2])
  cov0<-cov(fyr0[,1:2])
  cov1<-cov(fyr1[,1:2])
  Gibbs <- list("y" = y, "R" = r,"Sample means for r=0"=exp0,"Sample means for r=1"=exp1
                ,"Varcov for r=0"=cov0,"Varcov for r=1"=cov1)
  return(Gibbs)
}
