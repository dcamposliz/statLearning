## lab intro to R

x <- c(1,3,2,5)
x

x = c(1,6,2)
x

y = c(1,4,3)
y

length(x)
length(y)

x + y

ls()		# lists variables in working memory
rm(x,y)
ls()
character(0)
rm(list=ls())

# commenting out next stuff because it is annoying
# ?matrix

x = matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x

x = matrix(c(1,2,3,4) ,2,2)
x

# let's try weird stuff w data organization in matrix
tr = c(1,2,3,4,5)

tr_matrix = matrix(data=tr, nrow=3)
tr_matrix

tr_matrix = matrix(data=tr, nrow=2)
tr_matrix

tr_matrix = matrix(data=tr, nrow=5)
tr_matrix

x
sqrt(x)
x^2
sqrt(x^2)

# rnorm() 
# function generalizes a vector of random normal variables
# with the first argument n the sample size
# by default mean = 0 and sd = 1

x = rnorm(4)
print("x is:")
x
sd(x)

y = rnorm(4)
print("y is:")
y
sd(y)		#standard deviation

cor(x,y)

x = rnorm(50)
y = x + rnorm(50, mean = 50, sd = .1)
cor(x,y)

# set.seed() standardizes "random" outputs such as from
# functions such as rnorm()
set.seed(1303)
rnorm(50)

set.seed(3)
y = rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)
