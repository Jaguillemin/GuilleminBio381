#Review for homework 10

#nested for loop
#create a sample matrix
mat<- matrix(sample(1:10, size=9), nrow=3, ncol=3)


#writng the loop
for(i in 1:nrow(mat)){
  #i holds the counter, it would 
  for(j in 1:ncol(mat)){  print(mat[i,j])
  }
} 
  # will go to row 1 and then move through column 123, then move out of loop to row to


#part 2, custom functions in for loops

#simulate temp data at 3 sites

site1<- runif(min=60, max=70, n=10)
site2<- runif(min=60, max=70, n=10)
site3<- runif(min=40, max=50, n=10)
temps.df<- cbind(site1,site2,site3)
head(temps.df)

# write a funciton to convert to celcious 

degf.to.degc<-function(x){
  degc<-(x-32)*(5/9)
  return(degc)
}

#repeat a function using a for loop

for (i in 1:ncol(temps.df)) {
  # apply something from1 to 3
 print( degf.to.degc(x=temps.df[,i]))
  
 }
  