#Pratice Exercise

# Create a 100 row DF with the following variables
#gender, spl, age, experience, grade, placement

(gender = sample(c('M','F'),size = 100, replace = T, prob = c(0.5,0.5)))
gender = factor(gender)
(spl = sample(c('Marketing','Finance','HR'),size = 100, replace = T, prob = c(0.4,0.4,0.2)))  
spl = factor(spl)
(age = sample(c(21:30), size=100,replace =T))
(experience = rnorm(100,mean = 4,sd= 1))
(grade = sample(c('A','B','C','D'),size = 100, replace = T,prob=c(0.4,0.3,0.2,0.1)))
grade = factor(grade)
(placement= sample(c('Yes','No'),size = 100,replace = T, prob = c(0.5,0.5)))
placement = factor(placement)
students = data.frame(gender, spl,age, experience,grade,placement)
str(students)
summary(students)

#Summarize the data in Various ways using diplyr
library(dplyr)
names(students)
students %>% group_by(placement,gender) %>% summarize(mean(experience), max(experience),mean(age))

plot(students)
students%>% filter(spl=='Marketing') %>% summarize(mean(age), mean(experience))
students%>% filter(spl=='Marketing') %>% group_by((spl)) %>%  summarize(mean(age), mean(experience))
students%>% filter(spl!='Marketing') %>% group_by((spl)) %>%  summarize(mean(age), mean(experience))
students%>% filter(spl!='Marketing' & gender=='F' & grade == 'A') %>% group_by((spl)) %>%  summarize(mean(age), mean(experience))

#Draw Few Graphs to Understand Distribution of Data

hist(students$age)
t1 = table(students$placement)
barplot(t1,col=1:2)
boxplot(students$age)
pairs(students[,c('age','experience')]) # Check
pie(t1)

par(mfrow=c(2,2))
pie(table(students$gender))
pie(table(students$placement))
pie(table(students$grade))
pie(table(students$spl))

par(mfrow=c(1,1))
table(students$gender, students$placement, students$spl)

#Find Students having Largest experiece in each spl  for each gender

#students %>% group_by(spl,gender) %>% arrange(spl, gender, experience) %>% summarize(top_n(1), experience)


#Reading and Writing into an Excel Sheet
write.csv(students,'./data/ximb.csv')
students2 = read.csv('./data/ximb.csv')
head(students2)

#Clustering
km3 = kmeans(students[,c('age','experience')],centers = 3)
km3
km3$centers
plot(students[,c('age','experience')], col=km3$cluster)

#Decision Tree
library(rpart)
library(rpart.plot)

tree = rpart(placement ~ . , data = students)
tree
rpart.plot(tree, nn=T, cex =0.8)
printcp(tree)

prune(tree,cp=0.3)

ndata = sample_n(students,3)
ndata
predict(tree, newdata = ndata, type='class')
predict(tree, newdata = ndata, type='prob')

#Logistic Regression
logitmodel1 = glm(placement ~ . , data= students, family='binomial')
summary(logitmodel1)
logitmodel1a = glm(placement ~ age , data= students, family='binomial')
summary(logitmodel1a)
logitmodel2 = glm(placement ~ age + gender , data= students, family='binomial')
summary(logitmodel2)

# Linear Regression
linear1 = lm(age ~ ., data =students)
summary(linear1)`
