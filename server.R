library(shiny)
shinyServer(function(input, output) {
        swiss$Edusp <- ifelse(swiss$Education < 20, swiss$Education, NA)
        model1 <- lm(Fertility ~ Education, data = swiss)
        model2 <- lm(Fertility ~ Edusp, data = swiss)

        model1pred <- reactive({
                EduInput <- input$sliderEdu
        predict(model1, newdata = data.frame(Education = EduInput))
        })
        model2pred <- reactive({
                EduInput <- input$sliderEdu
        predict(model2, newdata =
                        data.frame(Edusp = EduInput))
        })

        output$plot1 <- renderPlot( {
                EduInput <- input$sliderEdu

                plot(swiss$Education, swiss$Fertility, xlab = "Education",
                     ylab = "Fertility", bty = "n", pch = 16,
                     xlim = c(0, 60), ylim = c(20, 110))
                if(input$showModel1){
                        abline(model1, col = "green", lwd = 2)
                }
                if(input$showModel2){
                        model2lines <- predict(model2, newdata = data.frame(
                                Edu = 0:55, Edusp = ifelse(0:55 < 20, 0:55,0:55 )
                        ))
                        lines(0:55, model2lines, col = "brown", lwd = 2)
                }

                legend(25, 250, c("Prediction with Outliers", "Prediction without outliers"), pch = 16,
                       col = c("green", "brown"), bty = "n", cex = 1.2)
                points(EduInput, model1pred(), col = "green", pch = 16, cex = 2)
                points(EduInput, model2pred(), col = "brown", pch = 16, cex = 2)
        })

        output$pred1 <- renderText({
                model1pred()
        })

        output$pred2 <- renderText({
                model2pred()
        })
        })










