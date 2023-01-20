# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)


# ui ----
ui <- fluidPage(

# app title ----
  tags$h1("My App Title"), # also can do h1("My App Title")


  # app subtitle ----
 tags$p(tags$strong("Exploring Antarctic Penguin Data")),

 #body mass sliderInput ----
 sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g):",
             min = 2700, max = 6300, value = c(3000, 4000)),

 # body mass plotOutput ----
 plotOutput(outputId = "body_mass_scatter")


) # END fluidPage




# server ----
server <- function(input, output){

  #filter data ----
  body_mass_df <- reactive({

    penguins %>%
      filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2])

  }) #END filter data



  #render scatter plot ----
  output$body_mass_scatter <- renderPlot({

    ggplot(na.omit(body_mass_df()),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15))




  }) # END render scatter plot




} # END server


# combine ui & server ----

shinyApp(ui = ui, server = server)






