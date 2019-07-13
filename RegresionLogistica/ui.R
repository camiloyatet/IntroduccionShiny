library(shiny)

fig.width <- 600
fig.height <- 450

shinyUI(pageWithSidebar(
  
  headerPanel("Regresión Logísitca Simple"),
  
  sidebarPanel(
    
    div(p("Encuentre los valores de los parámetros de la regresi+on que maximice la verosimilitud")),
    div(
      
      sliderInput("intercept",
                  strong("Betta_0"),
                  min=-3, max=3, step=.25,
                  value=sample(seq(-3, 3, .25), 1), ticks=FALSE),
      br(),
      sliderInput("slope", 
                  strong("Betta_1"),
                  min=-3, max=3, step=.25, 
                  value=sample(seq(-2, 2, .25), 1), ticks=FALSE),
      br(),
      checkboxInput("logit",
                    strong("Gráfica con función de enlace logit"),
                    value=FALSE),
      br(),
      checkboxInput("summary",
                    strong("Mostrar Resumen (glm(y ~ x))"),
                    value=FALSE)
      
    )
  ),
  
  mainPanel(
    plotOutput("reg.plot", width=fig.width, height=fig.height),
    plotOutput("like.plot", width=fig.width, height=fig.height / 3),
    div(class="span7", conditionalPanel("input.summary == true",
                                        p(strong("Resumen GLM")),
                                        verbatimTextOutput("summary")))
  )
  
))
