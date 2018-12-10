source('Preprocess.R')

library(randomForest)

## Define prediction formula
model <- randomForest(formula, data=train)
summary(model)

## Predict on new data
predictions <- predict(model, newdata=test)
predictions <- as.factor(predictions)

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
