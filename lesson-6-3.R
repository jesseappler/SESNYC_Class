# Libraries
library(shiny)
library(ggplot2)
library(dplyr)

# Data
species <- read.csv("data/species.csv", stringsAsFactors = FALSE)
surveys <- read.csv("data/surveys.csv", na.strings = "", stringsAsFactors = FALSE)
plots <- read.csv("data/plots.csv", stringsAsFactors = FALSE)

# User Interface
in1 <- selectInput("pick_species",
                   label = "Pick a species",
                   choices = unique(species[["species_id"]]))
in2 <- selectInput("pick_plot",
                   label = "Pick an experimental treatment",
                   choices = unique(plots[["plot_type"]]))
out2 <- plotOutput("species_plot")
side <- sidebarPanel("Options", in1, in2)
main <- mainPanel(out2, out3)
out3 <- textOutput("species_name")
tab <- tabPanel("Species", sidebarLayout(side, main))
ui <- navbarPage(title = "Portal Project", tab)

# Server
server <- function(input, output) {
  output[["species_plot"]] <- renderPlot(surveys %>%
                                           filter(species_id == input[["pick_species"]]) %>%
                                           ggplot(aes(x=year, fill = input[["pick_plot"]]))+
                                                    geom_bar()
  )
  output[["species_name"]] <- renderText(species %>%
                                           filter(species_id == input[["pick_species"]]) %>%
                                           select(genus:species)%>%
                                           paste(sep = " ", collapse = " "))

  output[["dataspecies_name"]] <- renderText(species %>%
                                           filter(species_id == input[["pick_species"]]) %>%
                                           select(genus:species)%>%
                                           paste(sep = " ", collapse = " "))
  
  }

# Create the Shiny App
shinyApp(ui = ui, server = server)