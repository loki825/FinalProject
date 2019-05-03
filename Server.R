shinyServer(function(input, output){
  
  model <- lm(Undergrads~ug_white+ug_Asian+ug_Black+ug_unkn,data=datafinal)
  
  prediction <- reactive({
    
          frstInput <- input$slider1
          secondInput <- input$slider2
          thirdInput<- input$slider3
          fourthInput <- input$slider4
  
  predict(model, newdata = data.frame(ug_white = frstInput,
                                      ug_Asian = secondInput, 
                                      ug_Black = thirdInput,
                                      ug_unkn = fourthInput))
  
  })
  grads <- reactive({
    
    frstInput <- input$slider1
    secondInput <- input$slider2
    thirdInput<- input$slider3
    fourthInput <- input$slider4
    
  })
  
  
      output$My_Plot <- renderPlot(
          ggplot(datafinal,aes(x=ug_white+ug_Asian+ug_Black+ug_unkn,y= residualValues3))+
          geom_smooth(method=lm,se=FALSE,color="grey")+
          geom_segment(aes(xend=ug_white+ug_Asian+ug_Black+ug_unkn,yend=residualValues3),alpha=0.2)+
          geom_point(aes(color=abs(residualValues3)))+scale_color_continuous(low="red",high="blue")+
          guides(color=FALSE)+geom_point(aes(y=predictedValues3),shape=1)+geom_point(aes(x=grads(),y=0), color = "Dark Green",size=7)
        
        
      )
      
      output$pred1 <- renderText(
        
        prediction()
      )
})