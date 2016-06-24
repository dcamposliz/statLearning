#	-----------------------------------------------------------------------------------------------------------------------
#
#	Course: 		Statistical Learning; Stanford Online, Lagunita; (https://lagunita.stanford.edu/courses/HumanitiesandScience/StatLearning/Winter2015/about)
#	Student: 		David Aaron Campos
#	Repository:		https://github.com/dcamposliz/statLearning
#	Date: 			June 2016
#	Faculty: 		Trevor Hastie; Rob Tibshirani
#	Textbook: 		Introduction to Statistical Learning; (http://www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf)
#
#	About R:		https://www.r-project.org/about.html
#
#	-----------------------------------------------------------------------------------------------------------------------
#
#	CHAPTER 2 - LAB INTRO TO R
#
#	-----------------------------------------------------------------------------------------------------------------------

# declaring variable with vector value
x <- c(1,3,2,5)
x

x = c(1,6,2)
x

y = c(1,4,3)
y

# checking length of vector variables with length() method
length(x)
length(y)

# simple operations
x + y

ls()			# lists variables in working memory
rm(x,y)			# remove variables from working memory
ls()			# lists variables in working memory
character(0)	# ?
rm(list=ls())	# ?


# ?tr_matrix 	# commenting out next stuff because it is annoying

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
sd(y)	#	standard deviation

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
