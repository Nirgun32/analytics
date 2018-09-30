#Factors

(grades = sample(c(LETTERS[1:4]),size=30,replace=T,prob = c(0.4,0.2,0.3,0.1)))
summary(grades)

gradesF = factor(grades)
summary(gradesF)

table(grades)
table(gradesF)

class(gradesF)
(gradesF0 = factor(grades,ordered=T))
(gradesF01 = factor(grades,ordered=T, levels = c('B','C','A','D')))

summary(gradesF01)

(marks = ceiling(rnorm(30,mean = 60,sd=5)))
(gender = factor(sample(c('M','F'),size = 30, replace=T)))

(student1 = data.frame(marks,gradesF01,gender))
student1$marks;student1$gradesF01

boxplot(marks ~ gradesF01, data = student1)
boxplot(marks ~ gradesF01 + gender, data = student1)

boxplot(marks)
summary(marks)
abline(h = summary(marks))
quantile(marks)
