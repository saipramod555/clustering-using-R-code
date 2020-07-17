data(iris) #loading the dataset
summary(iris) #summary of the dataset
head(iris) #dsipalying the first 6 rows of the dataset
x = iris[,-5]
y = iris$Species
set.seed(27)
#finding the number of clusters using elbow method
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(x, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
# Fitting K-Means to the dataset
set.seed(27)
kmeans = kmeans(x , centers = 3)
kmeans
table(y,kmeans$cluster)
#visulaizing the clusters 
plot(x[c("Sepal.Length", "Sepal.Width")], col=kmeans$cluster)
points(kmeans$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=23, cex=3)