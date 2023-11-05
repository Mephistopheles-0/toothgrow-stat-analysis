# Loading the ToothGrowth dataset
data(ToothGrowth)

# Printing the structure of the dataset
str(ToothGrowth)

# Displaying the first few rows of the dataset
head(ToothGrowth)

# Basic statistics summary
summary(ToothGrowth)

# Boxplot for the variable 'len'
boxplot(ToothGrowth$len, 
        main="Boxplot of Length", 
        xlab="Supplement", 
        ylab="Length", 
        col=c("orange","green","blue"), 
        border="brown")

# Histogram for the variable 'len'
hist(ToothGrowth$len, 
     main="Histogram of Length", 
     xlab="Length", 
     ylab="Frequency", 
     col="skyblue")

# Density plot for the variable 'len'
plot(density(ToothGrowth$len), 
     main="Density Plot of Length", 
     xlab="Length", 
     ylab="Density", 
     col="red")

# Q-Q plot for checking normality of the variable 'len'
qqnorm(ToothGrowth$len, 
       main="Q-Q Plot of Length")
qqline(ToothGrowth$len)

# Correlation matrix for the dataset
cor_matrix <- cor(ToothGrowth[sapply(ToothGrowth, is.numeric)])
print(cor_matrix)

# Heatmap of the correlation matrix
library(ggplot2)
heatmap(cor_matrix, 
          main="Heatmap of Correlation Matrix", 
          xlab="Variables", 
          ylab="Variables", 
          col="green", 
          dendrogram="row", 
          trace="none")

# ANOVA for checking the effects of the variable 'supp' on the variable 'len'
anova_result <- aov(len ~ supp, data=ToothGrowth)
print(summary(anova_result))

# Tukey's HSD post-hoc test for multiple comparisons
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)