#simple linear regression

dataset = read.csv('Salary_Data.csv')

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)

training_set = subset(dataset,split==TRUE)
test_set = subset(dataset,split==FALSE)

#fitting linear regression  to training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#predicting  the test set results
y_pred = predict(regressor, newdata=test_set)

#visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience,y = training_set$Salary),colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience,y  = predict(regressor,newdata = training_set)),colour = 'blue') +
  ggtitle('SalaryvsExperience(Training Test)') + xlab('Years of experience') + ylab('Salary')

#visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience,y = test_set$Salary),colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience,y  = predict(regressor,newdata = training_set)),colour = 'blue') +
  ggtitle('SalaryvsExperience(Test set)') + xlab('Years of experience') + ylab('Salary')
