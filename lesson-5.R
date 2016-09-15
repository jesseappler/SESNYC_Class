## Libraries and data
install.packages("ggplot2", dependencies = TRUE)

library(dplyr)
library(ggplot2)
surveys <- read.csv("data/surveys.csv", na.strings = "") %>%
  filter(!is.na(species_id), !is.na(sex), !is.na(weight))

## Constructing layered graphics in ggplot

ggplot(data = surveys,
       aes(x = species_id, y = weight)) +
  geom_point()

head(surveys)

ggplot(data = surveys,
       aes(x = species_id, y = weight)) +
  geom_boxplot()+
  geom_point(stat = "summary",
             fun.y = "mean",
             color = "red")

## Exercise 1

ggplot(data = (surveys %>% filter(species_id == "DM")) ,
       aes(x = year, y = weight, color = factor(sex))) +
  geom_point(stat = "summary",
             fun.y = "mean")
             

## Adding a regression line

levels(surveys$sex) <- c("Female", "Male")
ggplot(data = (surveys %>% filter(species_id == "DM")) ,
       aes(x = year, y = weight, color = sex)) +
  geom_point(aes(shape = sex),
             size = 3,
              stat = "summary",
              fun.y = "mean")+
  geom_smooth(method = "lm")


year_wgt <- ggplot(data = (surveys %>% filter(species_id == "DM")) ,
       aes(x = year, y = weight, color = sex)) +
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean")+
  geom_smooth(method = "lm")


year_wgt +
  scale_color_manual(values = c("magenta", "darkblue"))
                     
year_wgt <- year_wgt +
  scale_color_manual(...)
year_wgt

## Exercise 2

ggplot(data = (surveys %>% filter(species_id == "DM")) ,
       aes(x = weight, fill = sex)) +
  geom_histogram(
             stat = "bin",
             binwidth = 3)+
  scale_fill_manual(values = c("magenta", "darkblue"))

## Axes, labels and themes

histo <- ggplot(data = (surveys %>% filter(species_id == "DM")) ,
                aes(x = weight, fill = sex)) +
  geom_histogram(
    stat = "bin",
    binwidth = 3,
    color = "white")+
  scale_fill_manual(values = c("magenta", "darkblue"))
histo

##Adding in the labels

histo <- histo +
  labs(title = "Dipodomys merriami weight distribution",
       x = "Weight (g)",
       y = "Count") +
  scale_x_continuous(breaks = c(20, 30, 40, 50, 60))
histo

##The solution for picky plotters!
histobw <- histo +
  theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = element_text(face = "bold", vjust = 2),
        axis.title.y = element_text(size = 13, vjust = 1),
        axis.title.x = element_text(size = 13, vjust = 0))
histobw

themetoBW <- theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = element_text(face = "bold", vjust = 2),
        axis.title.y = element_text(size = 13, vjust = 1),
        axis.title.x = element_text(size = 13, vjust = 0))
histoBW2 <- histo + themetoBW
histoBW2

## Facets

surveys$month <- as.factor(surveys$month)
levels(surveys$month) <- c("January", "February", "March", "April", "May", "June",
                              "July", "August", "September", "October", "November", "December")

ggplot((data = (surveys %>% filter(species_id == "DM"))),
        aes(x = weight)) +
         geom_histogram(binwidth = 4, color ="white", fill = "darkblue") +
         facet_wrap(~month) +
   labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)")

ggplot(data = surveys_dm,
       aes(x = weight, fill = month)) +
  ...
  facet_wrap( ~ month) +
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)

## Exercise 3

...

