require("datasets")
set.seed(85237) #Choose your own seed
data(iris) #Load in the iris dataset
iris$Species <- NULL #Removes species for unsupervised learning
head(iris) #Look at top rows of dataset

#Function to normalize value to new value between 0 and 1
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
#Normalize all values
iris$Sepal.Length <- normalize(iris$Sepal.Length)
iris$Sepal.Width<- normalize(iris$Sepal.Width)
iris$Petal.Length<- normalize(iris$Petal.Length)
iris$Petal.Width<- normalize(iris$Petal.Width)
head(iris)

#Run KMeans algorithm
result<- kmeans(iris,3) #Use KMeans with k=3
result$size #Gives number of points in each cluster
result$centers #Gives value of cluster centers
result$cluster #Gives cluster vectors

#Plot
par(mfrow=c(2,2), mar=c(5,4,2,2)) #Creates a layout
plot(iris[c(1,2)], col=result$cluster)
plot(iris[c(1,2)], col=iris.class)
plot(iris[c(3,4)], col=result$cluster)
plot(iris[c(3,4)], col=iris.class)

#Result
table(result$cluster,iris.class)

#Done
