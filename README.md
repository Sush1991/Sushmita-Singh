# Sushmita-Singh
#Read the data from Carsale.csv
my_data <- read.table("C:/Users/Sushmita Singh/Desktop/Assignments/QuanManagement/Sept_8/Carsale.csv", 
                  header = TRUE,
                  sep =",",
                  stringsAsFactors = FALSE)

#To see the data copied in my_data
my_data

#Produce summary statistics of the data

# compute the mean of car units
mean(my_data$units) 

#compute the median of year
median(my_data$year)

#compute the minimum value 
min(my_data$units)

#compute the maximum value 
max(my_data$units)


#compute the range
range(my_data$year)

#compute the interquantile value 
quantile(my_data$year)
quantile(my_data$units)
IQR(my_data$units)

#compute the varience
var(my_data$units)
#compute the standard deviation=sq root of the varience
sd(my_data$units)

#compute the summary
summary(my_data$units)
summary(my_data$year)

#stripcharts
stripchart(my_data$units,method = "jitter")
stripchart(my_data$units,vertical=TRUE,method="jitter")

#histogram
hist(my_data$units,breaks = 2)

#boxplot
boxplot(my_data$srno,my_data$units)

#plot
plot(my_data$year,my_data$units)


                  
