
library(help = "datasets")

summary(iris)

data(iris)
iris

###################################################################################################
library(rpart)
rpart.iris <- rpart(Species ~. ,data = iris,  control = rpart.control(maxdepth = 4))
rpart.iris
summary(rpart.iris)

library(party)
library(partykit)
rpart.plot <- as.party(rpart.iris)
plot(rpart.plot)

a <- 3
b <- 1
test <- as.data.frame(cbind(5,3,a,b))
names(test) <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')

predict(rpart.iris, newdata = test, type = 'prob')
predict(rpart.iris, newdata = test, type = 'class')

str(x) 
x[[1]]
x[1]
cls.list <- cbind(clsTest, rpPred)


###################################################################################################
library(psych)

pairs.panels(iris)


##################
## shiny deploy

devtools::install_github('rstudio/shinyapps')

shinyapps::setAccountInfo(name='natrot', token='243CC306DED18F6F0691F715DA76FBDA', 
                          secret='4DXnMJ/0KNzP8UuYZum2UstHHyUNCld3MOXCVmMn')

## actual deploy
library(shinyapps)
shinyapps::deployApp('C:/Users/Administrator/Documents/CourseraDataProducts')
