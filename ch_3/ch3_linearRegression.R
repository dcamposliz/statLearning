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
#	CHAPTER 3 - LINEAR REGRESSION
#
#	Index:
#	
#		Simple Linear Regression
#		Multiple Linear Regression
#		Nonlinear Terms and Interactions
#		Qualitative Predictors

#	-----------------------------------------------------------------------------------------------------------------------

# loading libraries

	library(MASS)	# datasets
	library(ISLR)	# datasets from the book

	pdf("ch3_linearRegression.pdf")		# outputting plots and other to PDF
	sink("ch3_linearRegression.txt")	# outputting terminal text to TXT

### Simple linear regression

	print("")
	print("-----------------------------------------------------------------------")
	print("")
	print("---------------- Playing with Simple linear regression ----------------")
	print("")
	print("-----------------------------------------------------------------------")
	print("")

	# names gives us the names of the variables within this dataset
	names(Boston)
	# gives us information about the Boston dataset
	?Boston	# Boston is a data.frame - this script gives us information about this dataset

	# we are plotting medv as a linear function of lstat, pulling the data from Boston dataset
	plot(medv ~ lstat, Boston)	# medv is median value of unnocupied homes, the response variable

	# developing model to estimate medv as a function of lstat pulling data from Boston
	fit1  = lm(medv ~ lstat, data = Boston)

	# outputting descriptive statistics about our model
	fit1
	summary(fit1)
	print("This tells us that there is a negative relationship between medv (median value of unnocupied homes) and lstat (lower status population)")
	print("Both coefficients (intercept and lstat) are very significant as per their respective t-stats and p-values")
	
	abline(fit1, col = "red") # this adds a fit1 line to the plot that we made earlier
	names(fit1)	# printing the variable names associated by fit1
	confint(fit1)	# finds confidence intervals for the fit

	# predict helps to query a linear model fit - in this case we are predicting with three particular values for lstat (5,10,15), and we are not asking for predictions but instead confidence intervals
	predict(fit1, data.frame(lstat=c(5,10,15)), interval="confidence") 


### Multiple Linear Regression 

	print("")
	print("-------------------------------------------------------------------------")
	print("")
	print("---------------- Playing with Multiple Linear Regression ----------------")
	print("")
	print("-------------------------------------------------------------------------")
	print("")

	# developing model
	# to estimate medv as a function of lstat
	# pulling data from Boston
	fit2 = lm (medv ~ lstat + age, data = Boston)
	# outputting descriptive statistics about our model
	summary(fit2)

	fit3 = lm (medv ~ ., data = Boston)
	# outputting descriptive statistics about our model
	summary(fit3)

	# here we output some statistical diagnostics information about5
	# our model with respect to the data
	par(mfrow = c(2, 2))
	# in particular, we output
	#
	#	residuals vs fitted
	#	normal Q-Q
	#	scale location, where we get square-root of residuals vs fitted values
	#	standardized residuals vs leverage

	# plotting our fit3 model
	plot(fit3)

	print("Now we are about to remove age and indus variables for model fit4:")
	# updating our model to remove variables age and indus
	fit4=update(fit3,~.-age-indus)
	# outputting summary of fit4
	summary(fit4)

	print("Now every variable left in model fit4 is significant for estimating median value of unnocupied homes.")

### Nonlinear terms and Interactions

	print("")
	print("-------------------------------------------------------------------------------")
	print("")
	print("---------------- Playing with Nonlinear Terms and Interactions ----------------")
	print("")
	print("-------------------------------------------------------------------------------")
	print("")

	# here we have linear model of medv as a function of the interaction between lstat and age
	fit5 = lm(medv ~ lstat * age, Boston)
	summary(fit5)
	print("We see that the interaction between lstat and age (lstat:age) is somewhat significant, even more so than the main effect of the age variable")

	# we are building a quadratic model of medv as a function of lstat and lstat squared
	# notice the interesting notation I(x^e) where x is the variable and e is the exponen
	fit6 = lm (medv ~ lstat + I(lstat^2), Boston); summary(fit6)
	print("Notice that both coefficients are strongly significant, the linear, and the quadratic")

	# now we attach boston
	#	the named variables in Boston are available in our data space
	# 	it makes it easier for making nice looking plots
	attach(Boston)

	# then we go back to a single pane plot layout
	#	that means a one by one layout
	par(mfrow=c(1,1))

	# then we plot medv by lstat
	plot(medv~lstat)

	# and, we want to include our model on top of this data
	# 	but cant use abline because that only works for straight lines
	# 	instead we use points
	points(lstat, fitted(fit6), col = "red", pch = 20)
	#	the first argument is lstat itself
	#	the second argument is our model itself, in this case fit6
	#	SO, FOR EACH VALUE OF lstat, WE GET THE VALUE OF medv ACCORDING TO OUR MODEL
	#	^^^ this up here is [awesome]
	#	the color should be red
	#	we output round ball graphic :) given pch = 20
	print("We are now plotting in red our estimation of medv (fit6) as a function or lstat; remember that fit6 is a quadratic function")

	# we fit medv as a polynomiol of degree 4
	fit7 = lm(medv~poly(lstat,4))
	# interesting to see what that's going to look like :D
	summary(fit7)

	#	then we include our model on top of the data
	points(lstat, fitted(fit7), col="blue", pch = 20)
	print("Our fit7 model seems to overfit the data, too wiggly; maybe following some rather isolated points toward the right tail.")

	# this gives us a 'listing' of 20 plotting characters with size 2
	plot(1:20, 1:20, pch=1:20, cex=2)

### Qualitative Predictors

	print("")
	print("---------------------------------------------------------------------")
	print("")
	print("---------------- Playing with Qualitative Predictors ----------------")
	print("")
	print("---------------------------------------------------------------------")
	print("")

	# Carseats is another one of our datasets
	fix(Carseats)	# throws up a dataframe on the screen
	names(Carseats)		# throws up the names of the variables in Carseats
	summary(Carseats)	# summary of each variable in Carseats

	fit1_b = lm(Sales ~ . + Income:Advertising+Age:Price, Carseats) # fitting model
	# note that we are adding everything to the prediction model,
	# including an interaction between Income and Advertising,
	# as well as another interaction between Age and Price

	summary(fit1_b)	# Income:Advertising are significant, but Price:Age are not
	
	contrasts(Carseats$ShelveLoc)	# shows how a qualitative variable will code when in linear model
	# since ShelveLoc has three levels
	# then this has two dummy variables

### Writing R Functions

	regplot = function (x, y){
		fit = lm(y ~ x)
		plot (y,x)
		abline(fit, col="red")

	}

	attach(Carseats)

	regplot(Price, Sales)

	regplot_2 = function(x,y,...){
		fit = lm(y~x)
		plot(x,y,...)
		# it is strange to me that the order in which variables are listed
		# is switched for the lm method and plot method
		# what is the rational behind that ?
		abline(fit, col = "red")
	}

	regplot_2(Price, Sales, xlab="Price", ylab="Sales", col="blue", pch=20)


