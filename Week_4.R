#pull repository 

#Intro to Dataframes

download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "Data/portal_data_joined.csv")

# Can look for files by hitting tab inside "". Known as tab complete

surveys <- read.csv(file = "Data/portal_data_joined.csv")

surveys

head(surveys)

#head looks at first 6 rows 

#important rules about vectors. **Can only store one thing** All columns are vectors 

# lets look at structure 

str(surveys)

# $ are used to subset data

dim(surveys)

# dim gives demensions 

nrow(surveys)
ncol(surveys)
tail(surveys)

names(surveys)

# Alsways think about what you get back when you use a fuction. 

rownames(surveys)

# Another really useful one:

summary(surveys)

# summary is good to use just to look at your data 

# subsetting dataframes by givig them a location index

animal_vec <- c ('mouse', "rat", "cat")

#surveys[rows,columns] leaving one of those dementions blank will result in the entire row or column. Using the bracket notion gives us a VECTOR

surveys[1,1]

head(surveys)

surveys[2,1]

# whole first column

surveys[,1]

# Using a single number with no comma will give us a dataframe with one column
surveys[1]

head(surveys[1])

#pull out the first three values in the 6th column

surveys[1:3,6]

animal_vec[c(1:3)]

# we can put vectors inside of [ ]  

# pull out a whole single observation
surveys[5,]
# what are we looking at (in this case a dataframe)


#negative sign to exclude indicies 

surveys[1:5,-1]

surveys[-10:34786,]

# what's happening? R doesn't like going past 0. How do you fix it?

surveys[-c(10,34786),]


surveys[c(10, 15, 20), ]


# more ways to subset 

surveys["plot_id"] #single column as dataframe

surveys[, "plot_id"] # single column as vector

surveys[["plot_id"]] #single column as vector, we'll come back to using double brackets with lists 

surveys$year # single column as vector. $ or $ tab will give you every option in your dataframe. Good for some things, bad for others 

#Challenge
#Create a data.frame (surveys_200) containing only the data in row 200 of the surveys dataset.
#Notice how nrow() gave you the number of rows in a data.frame?
#Use that number to pull out just that last row in the data frame.
#Compare that with what you see as the last row using tail() to make sure it’s meeting expectations.
#Pull out that last row using nrow() instead of the row number.
#Create a new data frame (surveys_last) from that last row.
#Use nrow() to extract the row that is in the middle of the data frame. Store the content of this row in an object named surveys_middle.
#Combine nrow() with the - notation above to reproduce the behavior of head(surveys), keeping just the first through 6th rows of the surveys dataset.

surveys_200 <-surveys[200,]
surveys_200

surveys[nrow(surveys),]

tail(surveys)

surveys_last <- surveys[nrow(surveys), ]

surveys_middle <- surveys [nrow(surveys)/2, ]
surveys_middle

surveys[-c(7:nrow(surveys)),]

# Finally, factors 

# Factors are integers with labels assigned to them. Have to be careful about factors because they are treated like integers

#creating our own factor 

sex <- factor( c("male", "female", "female", "male"))
sex

class(sex)
typeof(sex)

#class tells us higher level description. Typeof gets into the guts. 

#levels() gives back a character vector of the levels

levels(sex)
levels(surveys$genus)


concentration <- factor(c("high", "medium", "high", "low"))
concentration                        

concentration <-factor(concentration, levels = c("low", "medium", "high"))
concentration

#let's try adding to a factor 

concentration <- c(concentration, "very high")
concentration

# coerces to characters if you add a value that doesn't match a current level

#let's just make them characters 

as.character(sex)

#factors with numeric levels 

year_factor <- factor(c(1990, 1923, 1965, 2018))

as.numeric(year_factor)

as.character(year_factor)

# this will actually give us a numeric vector 
as.numeric(as.character(year_factor))

#recommended way

as.numeric(levels(year_factor))[year_factor]

# why the heck all the factors?

?read.csv

survey_no_factors <- read.csv(file = "Data/portal_data_joined.csv", stringsAsFactors = FALSE)

str(survey_no_factors)

#renaming factors 

sex <- surveys$sex
levels(sex)
levels(sex)[1] <- "undetermined"
levels(sex)
head(sex)



# working with dates

library(lubridate)

my_date <- ymd("2015-01-01")
str(my_date)

my_date <- ymd(paste("2015", "05", "17", sep = "-"))
my_date

paste(surveys$year, surveys$month, surveys$day, sep = "-")

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
surveys$date
