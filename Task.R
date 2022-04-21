#1.1 Principal Component Analysis (PCA) 

install.packages("tidyverse")
library(tidyverse)
install.packages("factoextra")
library(factoextra)
birds <- read.csv("birds.csv")
View(birds)
bird_data <-subset(birds, select = c(1:5)) 
prcomp(bird_data, scale. = TRUE)
pca <- prcomp(bird_data, scale. = TRUE)
summary(pca)

# visualization 
fviz_pca_biplot(pca,axes=c(2,3),repel = TRUE,title = "PCA - Biplot") # Biplot
fviz_screeplot(pca,title = "PCA - Screeplot") #screeplot
plot(pca$rotation[,2], pca$rotation[,3],xlim =c(-1,1),ylim =c(-1,1),main='Loading plot-PC2 vs PC3',xlab = "PC2",ylab = "PC3")

#1.2 Hierarchical clustering

library(cluster)
library(dendextend)
library(dplyr)
distance_mat <- dist(birds, method = 'euclidean') #euclidean method
## if manhattan method change euclidean into manhattan
set.seed(240)  # Setting seed
Hierar_cl <- hclust(distance_mat, method = "single") #single linkage
## we can change method of linkage by into complete type "complete"
# method of likage average  type "average"
#In ward's method There is 2 method "ward.D" and "ward.D2" 
Hierar_cl
# plot Dendrogram
plot(Hierar_cl)

