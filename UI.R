shinyUI(fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput("slider1","select the value:", -1400,1400,10,10),
      sliderInput("slider2","select the value:", -1400,1400,10,10),
      sliderInput("slider3","select the value:", -1400,1400,10,10),
      sliderInput("slider4","select the value:", -1400,1400,10,10)
    ),
    mainPanel(
      
      plotOutput("My_Plot"),
      h4("predicted Value"),
      textOutput("pred1")
    )
  )
)
)