data <- read.table("data file path here",header=TRUE,sep=",")

summary(data)

plot(data$Fare, data$Survived)

data$Sex <- factor(data$Sex)
data$Embarked <- factor(data$Embarked)

reg1 <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=data, family = 'binomial')
summary(reg)

#AIC: 652.34
# Embarked non-significant

reg2 <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare, data=data, family = 'binomial')
summary(reg2)

#AIC: 649.81
# SibSp becomes significant, Parch is next non-significant

reg3 <- glm(Survived ~ Pclass + Sex + Age + SibSp + Fare, data=data, family = 'binomial')
summary(reg3)

#AIC: 648.07
# Fare non-significant

reg4 <- glm(Survived ~ Pclass + Sex + Age + SibSp, data=data, family = 'binomial')
summary(reg4)
# AIC: 646.72
"all parameters significant
(Intercept)  5.600846   0.543441  10.306  < 2e-16 ***
Pclass      -1.317398   0.140900  -9.350  < 2e-16 ***
Sexmale     -2.623483   0.214524 -12.229  < 2e-16 ***
Age         -0.044385   0.008155  -5.442 5.26e-08 ***
SibSp       -0.376119   0.121080  -3.106  0.00189 ** "

plot(data$Age, data$Survived)