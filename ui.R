library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Decision tree model"),
  sidebarLayout(  
    
    sidebarPanel(
      h3("Information"),
      br(),br(),
      wellPanel(h4('Introduction'),
                br(),
                'This shiny app performs classification modeling on the R iris data set.',br(),br(),
                'The app is a simple illustration of the discussions in the Developing Data Products MOOC on Coursera'),
      wellPanel('The app includes the following four sections (available on the right panel):',br(),
                h4('Data'),
                'The data tab contains a table with the data in the iris data set',br(),
                h4('Features'),
                'In the features section a correlation plot is shown to investigate the data set more.',br(),
                h4('Model'),
                'The model used is shown in this section.',br(),
                h4('Forecast'),
                'Lastly there is a section to run a forecast based on some input.',br()),
      br()
    ),
    
    
    mainPanel(
      tabsetPanel(id = 'treemod',
                  tabPanel('Data', 
                           'Below is a table with all the data in the iris data set.',br(),br(),
                           'To download the data click on the download button below.',br(),br(),
                           downloadButton('dldat', 'Download Data'),br(),br(),
                           dataTableOutput('datatab')
                           ),
                  tabPanel('Features', 
                           'To illustrate the correlations between the different features a pairs plot is shown.',br(),
                           plotOutput('corplot')),
                  tabPanel('Model', 
                           'The model used is a decision tree and the actual model is shown below.',br(),
                           plotOutput('modplot')),
                  tabPanel('Forecast',
                           'To use the model to predict the species, fill in the Petal width and length below.',br(),br(),
                           h4('Input'),
                           sliderInput(inputId = 'p.length', label ='Petal length', 
                                       min = 0, max = 7, step = 0.1, value = 1),
                           sliderInput(inputId = 'p.width', label ='Petal width', 
                                       min = 0, max = 3, step = 0.1, value = 1),
                           br(),br(),
                           'Below is the prediction. 
                           All three species are given together with the predicted probability:', br(),br(),
                           verbatimTextOutput('irisprob')))               
    )
  )
)
)