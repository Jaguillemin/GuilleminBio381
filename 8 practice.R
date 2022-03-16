#########################
#practice data sims
#3/16/22
#JAG
####################


library(boot)

#why we simulate data
#saves time: write parts of the code before I have data
#Baseline for conmparisons: checking assumpations in your data
# test new stats techniques: known parameters


#Part 1: normally distributed data

#start with groups of data
#input into t test or an aova


#simulate groups with 20 obvs

group1<- rnorm(n= 20, mean= 2, sd=1)

hist(group1)

group2<- rnorm(n=20, mean= 5, sd=1)
hist(group2)
#shift

group3 <- rnorm(n=20, mean=2, sd=3)
hist (group3)
#wider distribution

# sim data for a linear regression
# two continous normal variables
# start simple: assume intercept 0
#slope beta1
#x is the predictor variable 


#start with a constant slope 
beta1 <- 1

# our predictor variable with normal dist
x<- rnorm(n=20)

# set up linear model

y<- beta1*x

# you can play with slopes

beta1<-1.5
y<-beta1*x
y==x


#change int

beta0 <-2
y<- beta0 +beta1*x
y==x
# when simulating you want to pull the slope and the intercepts form literature

#adding covariates can make it more complex, can drew from a dif dist(like gamma)

#Part2: abundance or count data
#option 1: data are normal-ish
#use round() to remove decimals, whole numbers
 abund1<- round(rnorm(n=20, mean=50, sd=10))
hist(abund1) 
# high mean normal SD means you can use round

#options 2: poisson distribution, small count, lamda center peak, lamda is kind of like the mean
abund2 <- rpois(n=20, lambda=3)

barplot(table(abund2))

#table function, counts the number of 1s, 2s, 3s... ect

#simulating something that will be not random(IE flowers have affectsby environ)
#to account for that creat lamdas, 20 diffferent sites with 20 different lambdas
#then use lambdas to get counts

#use a regression to get the inital values

pre.lambda<-beta0+beta1*x
#cant be negative, always postive
#use inverse log for positivity

lambda<-exp(pre.lambda)

#use lambda vals we created to get counts

abund3<- rpois( n=20 , lambda=lambda)
hist(abund3)
# this is showing that x is the affect of the envrionemt 


#part3: occupancy or presence abscence data
#options 1: getting probs from a beta dist
probs<- rbeta(n=20, shape1=1,shape2=1)
#probablities of sucess,

occ1<-rbinom(n=20, size=1, prob=probs)
  print(occ1)
#occupancy isnt random, something guides this (IE food)
#options 2: occupancy with a covariant
  # similar ot above excpet we are generating probs, not lambdas
  
  pre.probs<-beta0+beta1*x
  print(pre.probs)

  
  #convert to a 0 to 1 scale
  
  psi<- inv.logit(pre.probs)
#create new occuppacny vals
  
  occ2<- rbinom(n=20, size=1, prob=psi)
hist(occ2)  
