# set up ui ----
ui <- navbarPage(

  title = "LTER Animal Data Explorer",

  #page 1: intro tab panel ----
  tabPanel(title = "About This App",

           "background info here - placehodler"

  ), # END page 1 tabpanel

  # page 2: Data tab panel ----
  tabPanel(title = "Explore the Data",

           #tabset panel ----
           tabsetPanel(

             #trout tab ----
             tabPanel(title = "Trout",

                      #trout sidebar layout ----
                      sidebarLayout(

                        #trout sidebar panel ----
                        sidebarPanel(

                          #channel_type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select Channel Type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      options = pickerOptions(actionsBox = TRUE),
                                      selected = c("cascade", "step (small falls)"),
                                      multiple = TRUE
                          ), # END pickerInput

                          #checkboxGroupButton input ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select sampling section(s):",
                                               choices = unique(clean_trout$section),
                                               selected = c("clear cut forest"),
                                               individual = FALSE,
                                               justified = TRUE,
                                               checkIcon = list(yes = icon("ok", lib = "glyphicon"),
                                                                no = icon("remove", lib = "glyphicon")))    # END checkbox group                                            )

                        ), #END trout sidebar panel

                        #trout main panel ----
                        mainPanel(

                          plotOutput(outputId = "trout_scatter")


                        ) #END trout main panel


                      ) # END trout sidebar layout


             ), # END trout tab

             #penguins tab
             tabPanel(title = "Penguin",

                      #penguins sidebar layout ----
                      sidebarLayout(

                        #penguins sidebar panel ----
                        sidebarPanel(

                          "penguin inputs here"

                        ), #END penguin sidebar panel

                        #penguin main panel
                        mainPanel(

                          "penguin outputs here"

                        ) #end penguin main panel

                      ) # END penguin sidebar layout

             ) # END penguins tab
           ) # END tabset panel

  ) #END data tabpanel

) #END navbarPage

