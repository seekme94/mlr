source('Preprocess.R')

## Define prediction formula
model <- knn3(formula, train, k=5)
summary(model)

## Predict on new data
predictions <- round(predict(model, test))
predictions <- as.factor(predictions[,2])

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
