## Tidy data concept

counts_df <- data.frame(
  day = c("Monday", "Tuesday", "Wednesday"),
  wolf = c(2, 1, 3),
  hare = c(20, 25, 30),
  fox = c(4, 4, 4)
)

## Reshaping multiple columns in category/value pairs

library(tidyr)
counts_gather <- gather(counts_df, 
                        key = "species",
                        value = "count",
                        wolf:fox)

counts_spread <- spread(counts_gather, 
                        key = species,
                        value = count)

## Exercise 1

counts_gather2 <- counts_gather[-8, ]

counts_spread2 <- spread(counts_gather2,
                         key = species,
                         value = count)

counts_spread3 <- spread(counts_gather2,
                         key = species,
                         value = count,
                         fill = 0)

## Read comma-separated-value (CSV) files

surveys <- read.csv("data/surveys.csv", na.strings="")
str(surveys)

## Subsetting and sorting

install.packages("dplyr")
library(dplyr)
surveys_1990_winter <- filter(surveys, 
                              year == 1990,
                              month %in% 1:3)

surveys_1990_winter2 <- select(surveys_1990_winter, 
                              record_id,
                              plot_id,
                              day,
                              month,
                              species_id,
                              sex,
                              hindfoot_length,
                              weight)

sorted <- arrange(surveys_1990_winter2, species_id, desc(weight))

head(sorted, 25)

tail(sorted, 25)

## Exercise 2

surveys_RO <- filter(surveys, 
                              species_id == "RO")

surveys_RO_min <- select(surveys_RO, 
                               record_id,
                               sex,
                               weight)

surveys_clever_AB <- select ((filter(surveys, species_id == "AB")), 
                             record_id,
                             month,
                             year)
## Grouping and aggregation

surveys_1990_winter_gb <- group_by(surveys_1990_winter2, species_id)

## group_by doesn't actually alter/change the data, just adds metadata that groups have been created within the data

counts_1990_winter <- summarize(surveys_1990_winter_gb, count = n())

## Exercise 3

surveys_clever_DM <- summarize(
                          (group_by(
                            (filter(
                              surveys, species_id == "DM")
                             ), month)),
                          meanweight = mean(weight, na.rm = TRUE), 
                          meanhindfootlength = mean(hindfoot_length, na.rm = TRUE)
                          )

## Pivto tables through aggregate and spread

surveys_1990_winter_gb <- group_by(surveys_1990_winter, ...)
counts_by_month <- ...(surveys_1990_winter_gb, ...)
pivot <- ...

## Transformation of variables

prop_1990_winter <- mutate(...)

## Exercise 4

...

## Chainning with pipes

surveys_clever_DM_piped <- surveys %>%
  filter(species_id == "DM") %>%
  group_by(month) %>%
  summarize(AvgWeight = mean(weight, na.rm=TRUE),
            AvgHindfootLength = mean(hindfoot_length, na.rm=TRUE))


Prop_1990_winter_piped <- surveys %>%
  filter(year == 1990, month %in% 1:3) %>%
  select(-year) %>%
  group_by(species_id) %>%
  summarize(n()) %>%
  
  ... # mutate into proportions