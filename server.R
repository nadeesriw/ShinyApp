function(input,output) {
  source("G:/My Drive/HPCF project F17/HPCF project F17-v1.1/gendata.R")
  source("G:/My Drive/HPCF project F17/HPCF project F17-v1.1/plotpdf.R")
  source("G:/My Drive/HPCF project F17/HPCF project F17-v1.1/conplot.R")
  library(MASS)
  
  output$mytable3 <- DT::renderDataTable({
    mu0<-c(input$mu01,input$mu02)
    mu1<-c(input$mu11,input$mu12)
    alpha<-c(input$alpha0,input$alpha1,input$alpha2)
    n<-input$n
    sigma0<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    sigma1<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    gibb<-gendata(mu0,mu1,sigma0,sigma1,alpha,n)
    view<-cbind(gibb$y,gibb$R)
    colnames(view)<-c("y1","y2","r")
    DT::datatable(view, options = list(lengthMenu = c(20, 50,100), pageLength = 20))
  })
  
  output$pdfplot1<-renderPlotly({
    mu0<-c(input$mu01,input$mu02)
    mu1<-c(input$mu11,input$mu12)
    alpha<-c(input$alpha0,input$alpha1,input$alpha2)
    n<-input$n
    sigma0<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    sigma1<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    gibb<-gendata(mu0,mu1,sigma0,sigma1,alpha,n)
    l<-pdfplot(gibb)
    l$`R=0`
  })
  output$pdfplot2<-renderPlotly({
    mu0<-c(input$mu01,input$mu02)
    mu1<-c(input$mu11,input$mu12)
    alpha<-c(input$alpha0,input$alpha1,input$alpha2)
    n<-input$n
    sigma0<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    sigma1<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    gibb<-gendata(mu0,mu1,sigma0,sigma1,alpha,n)
    l<-pdfplot(gibb)
    l$`R=1`
  })
  output$conplot1<-renderPlot({
    mu0<-c(input$mu01,input$mu02)
    mu1<-c(input$mu11,input$mu12)
    alpha<-c(input$alpha0,input$alpha1,input$alpha2)
    n<-input$n
    sigma0<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    sigma1<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    gibb<-gendata(mu0,mu1,sigma0,sigma1,alpha,n)
    k<-conplot(gibb,mu0,mu1,sigma0,sigma1,n)
    k$`R=0`
  })
  output$conplot2<-renderPlot({
    mu0<-c(input$mu01,input$mu02)
    mu1<-c(input$mu11,input$mu12)
    alpha<-c(input$alpha0,input$alpha1,input$alpha2)
    n<-input$n
    sigma0<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    sigma1<-matrix(c(input$sigma1,input$rho*sqrt(input$sigma1*input$sigma2),
                     input$rho*sqrt(input$sigma1*input$sigma2),input$sigma2),2,2)
    gibb<-gendata(mu0,mu1,sigma0,sigma1,alpha,n)
    k<-conplot(gibb,mu0,mu1,sigma0,sigma1,n)
    k$`R=1`
  })
  
  #pdfplot(input$mu0[1],input$mu1[1],matrix(c(input$sigma01,input$cov0,input$cov0,input$sigma02),2,2),
  #       matrix(c(input$sigma11,input$cov1,input$cov1,input$sigma12),2,2),
  #      input$alpha0[1],input$alpha1[1],input$alpha2[1],input$n[1])
}