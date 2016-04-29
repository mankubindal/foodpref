
library(shiny)
library(rCharts)

shinyUI(
        pageWithSidebar(
                headerPanel("Food Preferences in People"),
                sidebarPanel(
                        radioButtons("gender", label = h5("Please Select Gender:"),
                                     c("Males" = "Males",
                                       "Females" = "Females"), 
                                     selected = 0,
                                     inline = FALSE),
                        
                        selectInput("age", label = h5("Please Select the Age group:"), 
                                    choices = list(" " = " ",                                         "15-17 yrs" = "15-17",
                                                   "15-17 yrs" = "15-17",
                                                   "18-24 yrs" = "18-24",
                                                   "25-34 yrs" = "25-34",
                                                   "35+ yrs" = "35+"), selected = 0),
                        
                        radioButtons("food", label = h5("\nPlease Select the Food Type You Like & Prefer:"),
                                     c("Junk" = "Junk",
                                       "Healthy" = "Healthy",
                                       "All Kind of Food" = "All Kind of Food"), 
                                     selected = 0),
                                               
                        actionButton("goButton", "Go!")
                        
                       
                        
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Estimation",
                                        h3('Food Preferences Outputs'),
                                        h6('Selected Gener: '),
                                        textOutput("gender"),
                                        h6('Selected Age Group'),
                                        textOutput("age"),
                                        h6('Selected Food Type'),
                                        textOutput("food"),
                                        h3("Result"),
                                        h2(verbatimTextOutput("estimation"))
                                         ),
                                tabPanel('Data Summary', 
                                         h3('Food Preferences Data'),
                                         dataTableOutput("dt")
                                        ),
                                tabPanel("Food Preference in Males Plot",
                                         showOutput("Plot1", "highcharts")
                                         #plotOutput("Plot1", "polycharts", height="300px", width = "500px")
                                        ),
                                tabPanel("Food Preference in Females Plot",
                                         showOutput("Plot2", "highcharts")
                                         #plotOutput("Plot1", "polycharts", height="300px", width = "500px")
                                )
                        ),
                        p(strong("Healther and Hegenic Food is key to a Prosper Society"))
                )
        ))