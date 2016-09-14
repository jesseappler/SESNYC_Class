## The Editor

vals <- seq(1,100)

vals2 <- seq(from = 100,
          to = 1)
## Vectors

counts <- c(4,3,7,5)


## Lists

x <- list(list(1,2), c(3,4))
y <- c(list(1, 2), c(3, 4))

## Factors

education <- factor(c("college", "highschool", "college", "middle"),
                 levels = c("middle", "highschool", "college", "graduate"),
                 ordered = TRUE)

## IDing levels and ordered changes to make sure it's represented in the order you want it

## Data Frames

df <- data.frame(education,counts)

## Exercise 1

species <- factor(c("bacteria","virus","fungus","animal","plant","plant","virus","bacteria"),
                  levels = c("virus", "bacteria","fungus","plant","animal"),
                  ordered = TRUE)

count <- c(14,23,5,7,2,7,8,22)

tally <- data.frame(species,count)


## Names

names(df) <- c('ed','ct')

df[3,"ct"]

tally[-5,"species"]

## Subsetting ranges

days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
weekdays <- days[2:6]
weekends <- days[c(1,7)]

## Exercise 2

weekdays2 <- days[c(-1,-7)]
MWF <- days[seq(from=2,
                to=6, 
                by=2)]

newrow <- list("fungus", 34)


## Anatomy of a function

first <- function(x) {
  result <- x[1, 1]
  return(result)
}

first(tally)

## Exercise 3

df[2:3, 1]

## Distributions and statistics

x <- rnorm(..., mean = .., sd = ...)
y <- r...(n = 100, size = 50, ...)

fit <- ...

## Exercise 4

...

## Install missing packages

requirements <- c('dplyr',
                  'ggplot2',
                  'leaflet',
                  'RSQLite',
                  'rgdal',
                  'rgeos',
                  'raster',
                  'shiny',
                  'sp',
                  'tidyr',
                  'tmap')
missing <- setdiff(requirements,
                   rownames(installed.packages()))

length(missing) == 0

if (length(missing) !=0) {
  install.packages(missing)
}
