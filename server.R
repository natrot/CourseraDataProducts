library(shiny)
library(psych)
library(rpart)
library(party)
library(partykit)

## get tree model ready
rpart.iris <- rpart(Species ~. ,data = iris,  control = rpart.control(maxdepth = 4))



shinyServer(function(input, output) {
  
##get data ready
dataInput <- reactive({  
  iris    
})
   
## download data
output$dldat <- downloadHandler(
  filename = function() 'irisData.csv',
  content = function(file) {
    write.csv(dataInput(), file)
  }, contentType = 'application/csv')

## data table
output$datatab <- renderDataTable({
  dataInput() 
}, options = list(aLengthMenu = c(5, 10, 25), iDisplayLength = 10))

## cor plot
output$corplot <- renderPlot({
  cor.plt <- dataInput()
  pairs.panels(cor.plt)
}, height = 700, width = 1000)

## model plot
output$modplot <- renderPlot({
  rpart.plot <- as.party(rpart.iris)
  plot(rpart.plot)
}, height = 700, width = 1000)

##forecast output
output$irisprob <- renderPrint({
  a <- input$p.length
  b <- input$p.width
  test <- as.data.frame(cbind(5,3,a,b))
  names(test) <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
  
  prb <- predict(rpart.iris, newdata = test, type = 'prob')
  print(prb)
})



})
