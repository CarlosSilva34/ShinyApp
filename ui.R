library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Fertility from Education"),
        sidebarLayout(
         sidebarPanel(
        sliderInput("sliderEdu", "What is the % education beyond primary school?", 0, 55, value = 8),
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
      checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE)
      ),

        mainPanel(
      plotOutput("plot1"),
      h3("Model1 - Predicted Fertility with outliers:"),
      textOutput("pred1"),
      h3("Model 2 - Predicted Fertilty without outliers:"),
      textOutput("pred2")

        )
        )
))











