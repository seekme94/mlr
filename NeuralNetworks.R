source('Preprocess.R')

## Define prediction formula
model <- avNNet(formula, train, allowParallel=TRUE, size=10)
summary(model)

## Predict on new data
predictions <- predict(model, test, type="class")

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
