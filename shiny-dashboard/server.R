server <- function(input, output) {

  #filter lake data ----
  filtered_lakes <- reactive({

    lake_data |>
      filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2])

  }) # END reactive df


  #build leaftlet map ----
  output$lake_map <- renderLeaflet({

    leaflet() |>

      # add tiles
      addProviderTiles("Esri.WorldImagery") |>

      # set view over area of interest (Alaska - Fish Creek Watershed Area)
      setView(lng = -152, lat = 70, zoom = 6) |>

      # add mini map
      addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |>

      # add marker points
      addMarkers(data = filtered_lakes(),
                 lng = filtered_lakes()$Longitude,
                 lat = filtered_lakes()$Latitude,
                 popup = paste(
                   "Site Name:", filtered_lakes()$Site, "<br>",
                   "Elevation:", filtered_lakes()$Elevation, "meters (above SL)", "<br>",
                   "Average Depth:", filtered_lakes()$AvgDepth, "meters", "<br>",
                   "Average Lake Bed Temperature:", filtered_lakes()$AvgTemp, "degrees Celcius"
                 )) # END markers

  }) # end render leaflet




}


