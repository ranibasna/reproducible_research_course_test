args = commandArgs(trailingOnly=TRUE)
#
filename <- args[1]

USArrests <- read.csv(file = filename)
df <- scale(USArrests)
set.seed(123)
# we will now apply kmeans method to cluster the data
#
km.res <- kmeans(df, 4, nstart = 25)
clustering_result <- cbind(USArrests, cluster = km.res$cluster)
write.csv(clustering_result, file = args[2])

# second stage of the project
# validating that the labels are making sense
