source('Preprocess.R')

## Define prediction formula
model <- glm(formula, family=binomial(link='logit'), data=train) 
summary(model)

## Predict on new data
predictions <- predict(model, newdata=test, type='response')
predictions <- as.factor(ifelse(predictions < 0.5, 0, 1))

## Confusion matrix and statistics
confusionMatrix(predictions, test$Survived)
