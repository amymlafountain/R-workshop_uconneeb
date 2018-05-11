#Data structures

#make a data frame (good for small data frames)

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

cats$weight
cats$coat
cats$weight + 2 #allows you to modify the entire column
cats$weight + cats$coat #can't perform because these are different data types
class(cats$weight) #to check class
class(cats$coat)
str(cats) #gives structure of data frame
str(cats$coat) #levels= factors can be ordered, in this case they are alphabetically
cats$coat

#to write to a data file
write.csv(x = cats, file = "data/feline_data.csv")


# change order of factors
cats$coats_reorder <- factor(x = cats$coat, 
                             levels = c("tabby", "calico", "black"), 
                             ordered = TRUE)
str(cats$coats_reorder)
levels(cats$coats_reorder)

#read in data
gap <- read.csv(file = "data/gapminder-FiveYearData (1).csv")
head(gap)
str(gap)

cats <- read.csv(file = "Data/feline_data.csv")

nrow(gap) #number of rows
ncol(gap) #number of columns
dim(gap) # gives number of rows followed by number of columns

colnames(gap) #column names (note that syntax is still important-R will do funny things with spaces, etc.)

#Subsetting data
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
x
names(x) <- c("a", "b", "c", "d", "e")
x
x[1] #to access a specific element of the data
x[3]
x[c(1,3)]

#getting slices- accessing first four objects in vector
x[1:4]
#to remove an element
x[-2] 
#to remove a string of elements
x[-(2:4)]

#subsetting a real data frame (gapminder data)
head(gap[1])
head(gap["pop"])
head(gap[,1]) #<-bc dataframes are subsetted in 2D, this will specify columns. left hand side of comma specifies rows.

#for example, if you only want to look at data for albania, just last four columns
albania <- gap[13:24, 3:6]
View(albania)

Afghanistan <- gap[1:12, 1:6]
View(Afghanistan)
Afghanistan$gdp <-Afghanistan$pop * Afghanistan$gdpPercap #creates a new column
View(Afghanistan)
write.csv(x = Afghanistan, file = "data/Afghanistan_data.csv")


