# superimpose the conditional distribution with the gibbs sampling data. 
conplot<-function(data,mu0,mu1,sigma0,sigma1,n){
  gibb<-data
  table<-cbind(gibb$y,gibb$R)
  library(ggplot2)
  
####-----------------------------Y,R=0--------------------------------------------------####
  fyr0<-subset(table,table[,3]==0)
  y<-ggplot(as.data.frame(fyr0), aes( x=fyr0[,1], y=fyr0[,2]) ) +
    geom_density2d()
  y
  yr0 = mvrnorm(n,mu0,sigma0)
  yr0<-cbind(yr0,rep(1,length(yr0)))
  dat3<-as.data.frame(cbind(rbind(fyr0,yr0)))
  names(dat3) <- c("y1", "y2", "df")
  dat3$df <- factor(dat3$df,
                    levels = c(0,1),
                    labels = c("Joint", "Conditional"))
  p<-ggplot(dat3, mapping =aes(y1,y2,col = df)) + 
    geom_density2d(size=1)+labs(color="Distribtuion type")+
    ggtitle("Conditional and Joint distribtuion for R=0")
  
####---------------------------------Y,R=1-------------------------------------------####
  fyr1<-subset(table,table[,3]==1)
  library(ggplot2)
  y<-ggplot(as.data.frame(fyr1), aes( x=fyr1[,1], y=fyr1[,2]) ) +
    geom_density2d()
  y
  yr1 = mvrnorm(n,mu1,sigma1)
  yr1<-cbind(yr1,rep(2,length(yr1)))
  dat4<-as.data.frame(cbind(rbind(fyr1,yr1)))
  names(dat4) <- c("y1", "y2", "df")
  dat4$df <- factor(dat4$df,
                    levels = c(1,2),
                    labels = c("Joint", "Conditional"))
  q<-ggplot(dat4, mapping =aes(y1,y2,col = df)) + 
    geom_density2d(size=1)+labs(color="Distribtuion type")+
    ggtitle("Conditional and Joint distribtuion for R=1")
  
  out<-list("R=0"=p,"R=1"=q)
  return(out)
}


