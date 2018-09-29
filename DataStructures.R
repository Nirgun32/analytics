# Data Structures in R
#Vectors----
x = 1:10 #Create Seq Nos from 1 to 10
x

(x1 = 1:20) #INITIALIZATION. ALSO <- CAN BE USED INSTEAD OF =

(x2 = c(1,2,13,4,5)) # Vector Creation
class(x2)

(x3 = letters[1:10]) #CHaracter Creations
LETTERS[1:26]

(x3b = c('a',"Dhiraj","4")) #Mix of ""and ''
class(x3b)

(x4=c(T, FALSE, TRUE,T,F))
class(x4)
?c

x5=c(3L,5L) #Putting Letter L takes it as purely integer
class(x5)

(x5b = c(1, 'a', T, 4L))
class(x5b)

#Access Elements
(x6= seq(0,100,by = 3)) # From, To, By - OrderWise
?seq

ls()  #Accessing Variables in the Current Environment
x6
length(x6) #Length of the Vector

x6[20] #Prints the value at that [] position
x6[2]

x6[c(2,4)]
x6[-1] # Print all except 1st Value (-) sign removes that value from consideration

x6[c(2,-4)] #Cant mix positive and negative integers, only 0s can be mixed with negative subscripts

x6[-c(1:10)] #Removes first 10 variables

length(x6)
x6[-(length(x6)-1)]
x6

(x7 = c(x6,x2))
x7


#Modify
sort(x6) #On Values operation
sort(x6[-c(1,2)]) # Sorting without first two values
sort(x6, decreasing = T)

rev(x6) #On Position Operation
seq(-3,10,by=0.2)
(x= -3:2)

x[2] = 0;x #Modifying Elements of a Vector
x[x<0] = 5 #Change all Values where element value is less than 0

x=x[1:4];x

#Delete Vector
(x = seq(1,5,length.out=6))
x=NULL
x

(x=rnorm(5)) #Creates normal distribution where mean = 0 , sd = 1
?rnorm

(x1=rnorm(1000,mean = 50, sd=5))
plot(density(x1))  #Plotting the curve

mean(x1)

abline(v=mean(x1), h=0.04) #Draws a vertical line at that point


#Matrices----

100:112

(m1 = matrix(1:12, nrow = 4))

(m2 =matrix(1:12, ncol=3, byrow=T)) #By Row fills row wise 

(x=101:124)
length(x)

matrix(x,nrow=6)

class(m1)
dim(m1)
attributes(m1)  #Dimension is just 1 attribute

#Access Elements of Matrix
m1
m1[1,2:3]
m1[c(1,2),]
m1[1:2,2:3]
m1[1:2,]

#Names of Cols and Rows
m1
paste("C","D",sep = "-")
paste("C",1:10,sep = "/")
m1
(colnames(m1) = paste('C',1:3,sep=''))
(rownames(m1) = paste('R',1:4,sep=''))

attributes(m1)

#Vector to Matrix
(m3 = 1:24)
dim(m3) = c(6,4)
m3

m2[,]
m2[1:5]

m2[c(TRUE,F,F,F),c(2,3)]  #Logical Indexing 
m2[c(T,F,F,F),c(F,T,T)]
m2[m2>5]

m1;m2
m1[c('R1'),c('C1','C3')]

m2[2,2] = 33
m2

rbind(m2,c(50,60,70)) #NEw Row Add
cbind(m2,c(12,24,36,48)) # NEw Column Add

colSums(m1);rowSums(m1)
colMeans(m1);rowMeans(m1)

t(m1) #Transpose
m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN='+') #RowWise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN='*') #ColWise
?sweep

#AddMargins
addmargins(m1,margin = 1,sum) #RowWise
addmargins(m1,margin = 1,sd) #RowWise

addmargins(m1,margin = 2,mean) #CloumnWise
addmargins(m1,c(1,2),mean) #Both Rows and Columns

addmargins(m1,c(1,2),list(list(mean,sum,max),list(sd,var))) #Both Rows and Columns



#Arrays----


#Data Frame----
#Create Vectors to be combined into DF
(rollno =1:30)
(sname = paste('student',1:30,sep=''))
(gender = sample(c('M','F'),size=30,replace = T,prob=c(0.7,0.3)))
(marks = floor(rnorm(30,mean=50,sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'),size = 30,replace = T, prob = c(0.5,0.5)))

set.seed(1234)  #Can be any number
?set.seed

df1 = data.frame(rollno,sname, gender, marks, marks2, course, stringsAsFactors = F)
str(df1)
head(df1)
head(df1,n=3)
tail(df1)
tail(df1,n=12)

summary(df1)
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)

df1
df1$gender  # $ seperator between data frame name and category
df1[,c(2,4)] # Multiple Columns
df1[1:10,]

#Factors----


#Lists----
