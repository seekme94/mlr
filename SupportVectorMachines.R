source('Preprocess.R')

library(e1071)

## Define prediction formula
model <- svm(formula, data=train)
summary(model)

## Predict on new data
predictions <- predict(model, newdata=test)
predictions <- as.factor(predictions)

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
