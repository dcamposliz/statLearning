
###############################################
#	ENVIRONMENT & DATA SETUP
###############################################/

# setting working directory
setwd("/home/dxc/myProjects/statLearning/ch_3/advertising_lab/")

#loading packages
require("ggplot2")

# setting output files
pdf("advertising.pdf")
sink("advertising_results.txt")
#loading our data
data <- read.csv("advertising.csv")
# attaching data column names to our environment
attach(data)
# getting a quick glance at our data
fix(data)
# outputting data column names
names(data)
# outputting data
write.table(data)



###############################################
#	EXPLORATORY ANALYSIS
###############################################

# here we plot the data for each column to get a feel for it
# as well as a histogram to see the data distribution

plot(Sales)
hist(Sales)

plot(TV)
hist(TV)
plot(TV, Sales)

plot(Radio)
hist(Radio)
plot(Radio, Sales)

plot(Newspaper)
hist(Newspaper)
plot(Newspaper, Sales)


# developing our linear first model
fit1 <- lm(Sales~TV)
summary(fit1)
confint(fit1)

qplot(TV, Sales)

plot(fit1)