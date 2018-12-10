library(caret)
library(titanic)

## Load the datasets
data("titanic_train")
data <- titanic_train
summary(data)

data$Embarked[data$Embarked==""] <- "S"

data$Age[is.na(data$Age)] <- median(data$Age,na.rm=T)

## Converting "Survived","Pclass","Sex","Embarked" to factors
for (i in c("Survived","Pclass","Sex","Embarked")){
  data[,i]=as.factor(data[,i])
}

## Splitting training and test data
set.seed(100)
random <- sample(1:nrow(data), nrow(data) * 0.8)
train <- data[random,]
test <- data[setdiff(1:nrow(data), random),]

## Define prediction formula
formula <- Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked
