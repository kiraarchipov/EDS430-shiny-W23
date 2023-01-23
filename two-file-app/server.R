# set up server ----
server <- function(input, output) {

  # trout df ----
  trout_filtered_df <- reactive({

    validate (
      need(length(input$channel_type_input) > 0, "Select at least one channel type."),
      need(length(input$section_input) >0, "Select at least one forest section.")
    )

    clean_trout %>%
      filter(channel_type %in% c(input$channel_type_input)) %>%
      filter(section %in% c(input$section_input))

  })

  #plot trout ----
  output$trout_scatter <- renderPlot({

    ggplot(trout_filtered_df(), aes(x = length_mm, y = weight_g,
                            color = channel_type, shape = channel_type)) +
      geom_point(alpha = 0.7, size = 5) +
      scale_color_manual(values = c("rapid" = "blue", "cascade" = "purple", "step (small falls)" = "black",
                                    "pool" = "yellow", "side channel" = "pink", "riffle" = "orange",
                                    "isolated pool" = "red")) +
      scale_shape_manual(values = c("cascade" = 15, "riffle" = 17, "isolated pool" = 19,
                                    "pool" = 18, "rapid" = 8, "step (small falls)" = 23,
                                    "side channel" = 25)) +
      labs(x = "Trout Length (mm)", y = "Trout Weight (g)", color = "Channel Type", shape = "Channel Type")

  }, alt = "some alt text will live here"

  )





}


