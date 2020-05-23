pdfplot<-function(data){
####------------------------------------------------------------------------------####
  #data = should be in the format of gendata
####------------------------------------------------------------------------------####
  gibb<-data
  table<-cbind(gibb$y,gibb$R)
####-------------------------Y,R=0 PLOT-------------------------------------------####
  library(plotly)
  fyr0<-subset(table,table[,3]==0)
  k0<-kde2d(fyr0[,1],fyr0[,2],n=50)
  m<-plot_ly(x = k0$x, y = k0$y, z = k0$z,type = "surface") %>%
  layout(title = "surface plot for Y,R=0",scene = list(
    xaxis = list(title = "y1"),
    yaxis = list(title = "y2"),
    zaxis = list(title = " ")
  ))
####-------------------------Y,R=1 PLOT-------------------------------------------####
  fyr1<-subset(table,table[,3]==1)
  k1<-kde2d(fyr1[,1],fyr1[,2],n=50)
  n<-plot_ly(x = k1$x, y = k1$y, z = k1$z,type = "surface") %>%
    layout(title = "surface plot for Y,R=1",scene = list(
      xaxis = list(title = "y1"),
      yaxis = list(title = "y2"),
      zaxis = list(title = " ")
    ))
  out<-list("R=0"=m,"R=1"=n)
  return(out)
  }

