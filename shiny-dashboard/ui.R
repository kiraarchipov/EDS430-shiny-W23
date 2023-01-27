# dashboard header ----

header <- dashboardHeader(

  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400

) # END Dashboard Header



#dashboard sidebar ----

sidebar <- dashboardSidebar(

  sidebarMenu(

    menuItem(text = "Welcome!", tabName = "Welcome", icon = icon("star")),

    menuItem(text = "Dashboard", tabName = "Dashboard", icon = icon("gauge"))

  ) # END sidebar menu

) # END dashboard Sidebar



#dashboard body ----

body <- dashboardBody(

  #tabItems, must match up with menu item tabNames above EXACTLY
  tabItems(

    # welcome tabItem
    tabItem(tabName = "Welcome",

            #lefthand column
            column(width = 6,

                   #lefthand box
                   box(width = NULL,

                       "background into and pic?"

                   ) # END lefthand box

            ), #END lefthand colum

            # righthand column
            column(width = 6,

                   #top fluid Row
                   fluidRow(

                     box(width = NULL,

                         "Citation info here"

                     ) #END top fluid row box

                   ), # END top fluid row

                   # bottom fluid row
                   fluidRow(

                     box(width = NULL,

                         "Disclaimer stuffs here"

                         ) # END bottom fluid row box

                   ) # END bottom fluid row

            ) # END right column

    ), # END welcome tab Item

    #dashboard tabItem
    tabItem(tabName = "Dashboard",

            #fluidRow
            fluidRow(

              #input box
              box(width = 4,

                  title = tags$strong("Adjust Lake Parameter Ranges:"),

                  # add slider input 1
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL):",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation),
                                        max(lake_data$Elevation))
                  ) #END slider input 1


              ), # END input box

              # leaflet box
              box(width = 8,

                  title = tags$strong("Monitored Lakes within Fish Creek WaterShed:"),

                  #leaflet output
                  leafletOutput(outputId = "lake_map") |>
                    withSpinner(type = 1, color = "#742361") #END leaflet output

              ) # END leaflet box


            ) # END fluid row


    ) # END dashboard tab item



  ) # END tab items






) # END dashboard body







# combine it all ----
dashboardPage(header, sidebar, body)






