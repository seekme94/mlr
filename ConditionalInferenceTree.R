source('Preprocess.R')

library(party)

## Define prediction formula
model <- cforest(formula, data=train)
summary(model)

## Predict on new data
predictions <- predict(model, newdata=test, type="response")

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
