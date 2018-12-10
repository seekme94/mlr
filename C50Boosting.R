source('Preprocess.R')

library(C50)

## Define prediction formula
model <- C5.0(formula, train, trials = 100, rules = TRUE, control=C5.0Control(earlyStopping=FALSE))
summary(model)

## Predict on new data
predictions <- predict(model, test, type="class")

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
