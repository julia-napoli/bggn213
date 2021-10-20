# Class 05: Data Visualization

# Today we are going to use ggplot2 package
# Need to install packages, but we only do this once
# install.packages("ggplot2")
library(ggplot2)

# We will use this built-in "cars" dataset first
head(cars)

# All ggplots have at least 3 layers,
# data + aes + geom
ggplot(data=cars) + 
  aes(x=speed, y = dist) + 
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title="Stopping Distance of Old Cars",
       x = "Speed (MPH)",
       y = "Distance (FT)")

# Side-note: ggplot is not the only graphics system
# a very popular one is good old "base" R graphics
plot(cars)

# Doing the adding more plot aesthetics part of lab worksheet
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Q: What are the column names?
colnames(genes)

# Q: How many genes are in the dataset?
nrow(genes)

# How many columns are there in the dataset?
ncol(genes)

# Q: How many upregulated genes are there?
table(genes$State)
127/5196
round(table(genes$State)/nrow(genes) * 100,2)

# Let's make a figure
p <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col = State) +
  geom_point()

p + scale_color_manual(values= c("blue","purple","pink"))

# Let's do some optional gapminder stuff
#install.packages("gapminder")
library(gapminder)
head(gapminder)

# Number of countries
nrow(gapminder)

# Let's make a new plot of year vs. life expectancy
ggplot(gapminder) +
  aes(x=year, y =lifeExp, col = continent) +
  geom_jitter(width=0.3,alpha=0.4) +
  geom_violin(aes(group = year), alpha = 0.2)

# Install the plotly
#install.packages("plotly")
# library(plotly)
# ggplotly()
