# User Interface



UI <- navbarPage(title = "Hello, Shiny World!")

# Server
SERVER <- function(input, output){}

# Create the Shiny App
shinyApp(ui = UI, server = SERVER)