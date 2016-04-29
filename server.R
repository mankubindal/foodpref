library(shiny)
library(rCharts)


data = read.csv("food.csv")

estimate <- function(gender="NONE", age, food) {

        
        if(gender == "Males")
        {
                if(age == "15-17")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of males those ", paste(data[1,3], data[1,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of males those ",paste(data[5,3], data[5,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of males those like",paste(data[9,3], data[9,4]))
                        }
                        else
                                "Please Select the food Type"
                }
                else if(age == "18-24")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of males those", paste(data[2,3], data[2,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of males those",paste(data[6,3], data[6,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of males those like ",paste(data[10,3], data[10,4]))
                        }
                        else
                                "Please Select the food Type"
                }
                else if(age == "25-34")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of males those ", paste(data[3,3], data[3,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of males those",paste(data[7,3], data[7,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of males those like",paste(data[11,3], data[11,4]))
                        }
                        else
                               paste( "Please Select the food Type")
                }
                else if(age == "35+")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of males those ", paste(data[4,3], data[4,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of males those ",paste(data[8,3], data[8,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of males those like",paste(data[12,3], data[12,4]))
                        }
                        else
                                "Please Select the food Type"
                }
                else
                        "Please Select the Age Group"
                
        }
        else if(gender == "Females")
        {
                if(age == "15-17")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of females those ", paste(data[13,3], data[13,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of females those ",paste(data[17,3], data[17,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of females those like ",paste(data[21,3], data[21,4]))
                        }
                        else
                                "Please Select the food Type"
                }
                else if(age == "18-24")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of females those ", paste(data[14,3], data[14,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of females those",paste(data[18,3], data[18,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of females those like ",paste(data[22,3], data[22,4]))
                        }
                        else
                                "Please Select the food Type"
                }
                else if(age == "25-34")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of females those ", paste(data[15,3], data[15,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of females those",paste(data[19,3], data[19,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of females those like",paste(data[23,3], data[23,4]))
                        }
                        else
                                "Please Select the food Type"
                }
                else if(age == "35+")
                {
                        if(food=="Junk")
                        {
                                paste("Estimation of females those ", paste(data[16,3], data[16,4]))
                        }
                        else if(food=="Healthy")
                        {
                                paste("Estimation of  females those",paste(data[20,3], data[20,4]))
                        }
                        else if(food=="All Kind of Food")
                        {
                                paste("Estimation of females those like ",paste(data[24,3], data[24,4]))
                        }
                        else
                                "Please Select the food Type"
                }
                else
                        "Please Select the Age Group"
                
        }
        else
                "0"
}

shinyServer(
        function(input, output){
     
                output$gender <- renderText({
                        input$goButton
                        isolate(input$gender)
                                })
                output$age <- renderText({
                        input$goButton
                        isolate(input$age)
                        })
                output$food <- renderText({
                        input$goButton
                        isolate(paste(input$food))
                        })
                
                output$estimation <- renderText({
                        if(input$goButton != 0)
                                {
                                        input$goButton
                                        isolate(estimate(input$gender, input$age, input$food))
                                }
                        })
                
                # 2nd Tab
                output$dt <- renderDataTable(data, options = list(iDisplayLength = 10))
                        
#                 output$dt <- renderDataTable({
#                         input$runButton
#                         if (input$goButton == 0) {return()}        
#                         else
#                         { as.matrix(data) }
#                         })

                # 3rd Tab
                output$Plot1 <- renderChart({
                        p1 <- hPlot(Estimate~Food_Type, data = subset(data, Gender=="Males"), type = c("line", "bubble"), group = "Age", size="Estimate")
                        p1$addParams(dom = 'Plot1')
                        return(p1)
                        })

                # 4th Tab
                output$Plot2 <- renderChart({
                        p2 <- hPlot(Estimate~Food_Type, data = subset(data, Gender=="Females"), type = c("line", "bubble"), group = "Age", size="Estimate")
                        p2$addParams(dom = 'Plot2')
                        return(p2)
                })


# 3rd Tab
#                 output$Plot1 <- renderChart({
# hPlot(Estimate ~ Age, data=data, type="bar")
#                          rPlot(Estimate ~ Age | Gender, color = 'College_Enrollment', data = data, type = 'bar')
#                         rPlot(Estimate ~ Age, color = 'College_Enrollment', data = data, type = 'bar')
# rPlot(Estimate~Age , color = 'Gender', data = data, type = 'bar')
# rPlot(Estimate~Gender |Age , color = 'College_Enrollment', data = data, type = 'bar')

#                         })


        })