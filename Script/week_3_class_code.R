# Week 3 homies 

#Julian date formula in excel: (your date) - Date(Year(your date), 1,0)

#Quality control uses in Excel: can be used as quality control
#1. Data
#2. Data Validation
#3. Set setting and any special error messages  

read.csv("Data/tidy.csv")

#Part two of class: Vectors 

x <- 4

# x <- 4 is a vector of one 

weight_g <- c(50, 60, 31, 89)
weight_g

# characters

animals <- c("mouse", "rat", "dog", "cat" )
animals

# characters must be in "" quotes

#vector exploration tools

length(weight_g)
length(animals)

#everything in a vector must be the same 

class(weight_g)
class(animals)

#str is a go to for looking at an object

str(weight_g)

# be careful about adding values and running the below line multiple times 
weight_g <- c(25, weight_g)
weight_g

#atomic vectors: cannot split, simplest structure R understands. 
#6 atomic vectors that R understands: "numeric", ("double"), "character", "logical", "integer", "complex", "raw"
#First four that are listed are the main ones we will be working with. 

typeof(weight_g)

# R recognizes integers by adding an L at the end; eg. ##L, ##L, etc.

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

num_char
num_logical
char_logical
tricky

class(num_char)
class(num_logical)
class(char_logical)
class(tricky)

combined_logical <- c(num_logical, char_logical)
combined_logical


#subsetting vectors

animals
animals[3]
animals[c (2, 3)]

#conditional subsetting

weight_g
weight_g[c(T, F, T, F, F, T)]
weight_g > 50
weight_g[weight_g > 50]

#multiple conditions

weight_g[weight_g < 30 | weight_g > 50]
weight_g[weight_g >= 30 & weight_g ==89]

#searching for characters

animals[animals == "cat"| animals =="rat"]

animals[animals %in% c( "rat", "antelope", "jackalope", "hippogriff")]

#challenege 

"four" > "five"
"six" >"five"
"eight" > "five"

#sorts the above alphabetically


#missing values 

heights <- c(2, 4, 4, NA, 6)
str(heights)

mean(weight_g)

mean(heights)

max(heights)

mean(x= heights, na.rm = TRUE)
