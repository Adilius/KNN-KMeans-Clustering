require("class")
require("datasets")
set.seed(85237) #Choose your own seed
data(iris) #Load in the iris dataset
head(iris) #Look at top rows of dataset

#Randomize dataset to make more natural
rnum <- sample(rep(1:150)) #Chooses numbers randomly between 1 and 150
rnum
iris<- iris[rnum,] #Shuffles the dataset
head(iris)

#Function to normalize value to new value between 0 and 1
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
#Normalize all values
iris.new<- as.data.frame(lapply(iris[,c(1,2,3,4)],normalize))
head(iris.new)

#Train subset
iris.train<- iris.new[1:130,]
iris.train.target<- iris[1:130,5]
iris.test<- iris.new[131:150,]
iris.test.target<- iris[131:150,5]
summary(iris.new)

#Run KNN using the learned modell on the testing modell
modell1<- knn(train=iris.train, test=iris.test, cl=iris.train.target, k=16)

#Display modell
table(iris.test.target, modell1)

#Done