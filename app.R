# app.R

library(shiny)

ui <- fluidPage(
  titlePanel("Conversor de Temperatura: Celsius ↔ Fahrenheit"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("temp", "Digite a temperatura:", value = 0),
      radioButtons("scale", "Converter para:",
                   choices = list("Fahrenheit" = "F", "Celsius" = "C"))
    ),
    
    mainPanel(
      h3("Resultado da Conversão:"),
      textOutput("converted")
    )
  )
)

server <- function(input, output) {
  output$converted <- renderText({
    req(input$temp)
    if (input$scale == "F") {
      temp_f <- input$temp * 9/5 + 32
      paste(input$temp, "°C é igual a", round(temp_f, 2), "°F")
    } else {
      temp_c <- (input$temp - 32) * 5/9
      paste(input$temp, "°F é igual a", round(temp_c, 2), "°C")
    }
  })
}

shinyApp(ui = ui, server = server)
