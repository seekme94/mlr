source('Preprocess.R')

library(rpart)

## Define prediction formula
model <- rpart(formula, data=train, method="class")
summary(model)

## Predict on new data
predictions <- predict(model, newdata=test, type="class")
predictions <- as.factor(predictions)

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
