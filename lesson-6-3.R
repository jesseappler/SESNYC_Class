# Libraries
library(shiny)
library(ggplot2)
library(dplyr)

# Data
species <- read.csv("data/species.csv", stringsAsFactors = FALSE)
surveys <- read.csv("data/surveys.csv", na.strings = "", stringsAsFactors = FALSE)

# User Interface
in1 <- selectInput("pick_species",
                   label = "Pick a species",
                   choices = unique(species[["species_id"]]))
out2 <- plotOutput("species_plot")
out3 <- textOutput("species_name")
tab <- tabPanel("Species", in1, out2, out3)
ui <- navbarPage(title = "Portal Project", tab)

# Server
server <- function(input, output) {
  output[["species_plot"]] <- renderPlot(surveys %>%
                                           filter(species_id == input[["pick_species"]]) %>%
                                           ggplot(aes(x=year))+
                                                    geom_bar()
  )
  output[["species_name"]] <- renderText(species %>%
                                           filter(species_id == input[["pick_species"]]) %>%
                                           select(genus:species)%>%
                                           paste(sep = " ", collapse = " "))
}

# Create the Shiny App
shinyApp(ui = ui, server = server)