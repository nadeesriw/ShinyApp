library(shinythemes)
library(plotly)
library(DT)
navbarPage("Data Generation",theme = shinytheme("lumen"),
           tabPanel("Plots",
                    (fluidPage(withMathJax(),
  #titlePanel("Proxy data"),
  sidebarLayout(
    sidebarPanel(
      #selectInput("n","Sample size",c("1000","3000","5000","10000","100000")),
      fluidRow(
      sliderInput("n","Sample size",1000,100000,1000)),
      
      fluidRow(
      helpText("$$\\mbox{Enter }\\alpha_{0},\\alpha_{1} \\mbox{ and } \\alpha_{2}$$"),
      column(4,sliderInput("alpha0", "$$\\alpha_{0}$$", 0, 100,1,step = 0.1)),
      column(4,sliderInput("alpha1","$$\\alpha_{1}$$", 0, 100,1,step = 0.1)),
      column(4,sliderInput("alpha2", "$$\\alpha_{2}$$", 0, 100,1,step = 0.1))
      ),
      
      #selectInput("r/y","Conditional distribution of R/Y=y ",c("Binomial"),selected=NULL),
      #selectInput("y/r","Conditional distribution of Y/R=r ",c("Normal"),selected=NULL),
      #sliderInput("mu0", "mu_{0}", 0, 100,50,step = 0.001),
      fluidRow(
        helpText("$$\\mbox{Enter }\\mu^{(0)} \\mbox{ = } \\left(\\begin{array}{c}
                  \\mu_{01} \\
                  \\mu_{02}
                 \\end{array}\\right)^{'}$$"),
        column(6,sliderInput("mu01","$$\\mu_{01}$$",0, 100,0,step = 0.01)),
        column(6,sliderInput("mu02","$$\\mu_{02}$$",0, 100,0,step = 0.01))
      ),
      #sliderInput("mu1", "mu_{1}", 0, 100,50,step = 0.001),
      fluidRow(
        helpText("$$\\mbox{Enter }\\mu^{(1)} \\mbox{ = } \\left(\\begin{array}{c}
                  \\mu_{11} \\
                  \\mu_{12}
                 \\end{array}\\right)^{'}$$"),
        column(6,sliderInput("mu11","$$\\mu_{11}$$",0, 100,2,step = 0.01)),
        column(6,sliderInput("mu12","$$\\mu_{12}$$",0, 100,3,step = 0.01))
      ),
      
      fluidRow(
      helpText("$$\\mbox{Enter }\\Sigma \\mbox{ = }\\begin{pmatrix}
                  \\sigma^{2}_{1} && \\sigma^{2}_{2} \\\
                 \\sigma_{12} && \\\ 
                 \\end{pmatrix}$$"),
      column(6,sliderInput("sigma1","$$\\sigma_{1}^{2}$$",0,100,1.2,0.01)),
      column(6,sliderInput("sigma2","$$\\sigma_{2}^{2}$$",0,100,1.4,0.01)),
      column(6,sliderInput("rho","$$\\rho$$",0,1,0.18,0.01))
    )),
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Generated data", 
                           br(),
                           helpText("Given below is the generated data using Gibb's Sampling method"),
                           br(),br(),
                           DT::dataTableOutput("mytable3"),
                           #tableOutput("text"),
                           withMathJax(textOutput("formula"))),
                  tabPanel("Surface plots",br(),
                           column(10,plotlyOutput("pdfplot1")),br(),br(),
                           column(10,plotlyOutput("pdfplot2"))),
                  tabPanel("Contour plots",
                          column(10,plotOutput("conplot1")),
                          column(10,plotOutput("conplot2"))))
    )
  )
)
),
tabPanel("Likelihood")
))