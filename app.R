# Loading libraries for app and graphics
library(shiny)
library(ggplot2)

# UI components
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "sample_size", label = "Sample size:", value = 30, min = 1),
      numericInput(inputId = "num_samples", label = "Number of samples:", value = 1000, min = 1),
      
      # Conditional Panels for Each Distribution
      conditionalPanel(
        condition = "input.tabs == 'Uniform'",
        numericInput(inputId = "min", label = "x1", value = 0, min = 0, max = 1, step = 0.1),
        numericInput(inputId = "max", label = "x2", value = 1, min = 0, max = 1, step = 0.1)
      ),
      conditionalPanel(
        condition = "input.tabs == 'Exponential'",
        numericInput(inputId = "rate", label = "Parameter: Rate", value = 1, min = 0, step = 0.1)
      ),
      conditionalPanel(
        condition = "input.tabs == 'T-Distribution'",
        numericInput(inputId = "df", label = "Degrees of Freedom", value = 10, min = 1, step = 1)
      ),
      conditionalPanel(
        condition = "input.tabs == 'F-Distribution'",
        numericInput(inputId = "df1", label = "Numerator Degrees of Freedom", value = 10, min = 1, step = 1),
        numericInput(inputId = "df2", label = "Denominator Degrees of Freedom", value = 10, min = 1, step = 1)
      ),
      conditionalPanel(
        condition = "input.tabs == 'Chi-Squared'",
        numericInput(inputId = "df_chi", label = "Degrees of Freedom", value = 10, min = 1, step = 1)
      ),
      conditionalPanel(
        condition = "input.tabs == 'Binomial'",
        numericInput(inputId = "num_trials", label = "Parameter: Number of Trials", value = 10, min = 0),
        numericInput(inputId = "prob", label = "Parameter: p", value = 0.5, min = 0, max = 1, step = 0.1)
      ),
      
      actionButton(inputId = "go_button", label = "Generate")
    ),
    
    mainPanel(
      tabsetPanel(
        id = "tabs",
        tabPanel(title = "Uniform", plotOutput(outputId = "uniform_plot")),
        tabPanel(title = "Exponential", plotOutput(outputId = "exponential_plot")),
        tabPanel(title = "T-Distribution", plotOutput(outputId = "t_plot")),
        tabPanel(title = "F-Distribution", plotOutput(outputId = "f_plot")),
        tabPanel(title = "Chi-Squared", plotOutput(outputId = "chi_squared_plot")),
        tabPanel(title = "Binomial", plotOutput(outputId = "binomial_plot"))
        
      )
    )
  )
)

# Server logic
server <- function(input, output) {
  
  observeEvent(eventExpr = input$go_button, handlerExpr = {
    
    # Generating Uniform Sample Data and Plot
    output$uniform_plot <- renderPlot({
      
      samples <- replicate(n = input$num_samples, 
                           expr = mean(runif(n = input$sample_size, min = input$min, max = input$max)))
      
      ggplot(data.frame(x = samples), aes(x = x)) + 
        geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "#028A0F", alpha = 0.5) + 
        geom_density(color = "blue") + 
        theme_linedraw()
    })
    
    # Generating Exponential Sample Data and Plot
    output$exponential_plot <- renderPlot({
      
      samples <- replicate(n = input$num_samples, 
                           expr = mean(rexp(n = input$sample_size, rate = input$rate)))
      
      ggplot(data.frame(x = samples), aes(x = x)) + 
        geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "#028A0F", alpha = 0.5) + 
        geom_density(color = "blue") +
        theme_linedraw()
    })
    
    # Generating T-Distribution Sample Data and Plot
    output$t_plot <- renderPlot({
      
      samples <- replicate(n = input$num_samples, 
                           expr = mean(rt(n = input$sample_size, df = input$df)))
      
      ggplot(data.frame(x = samples), aes(x = x)) + 
        geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "#028A0F", alpha = 0.5) + 
        geom_density(color = "blue") + 
        theme_linedraw()
    })
    
    # Generating F-Distribution Sample Data and Plot
    output$f_plot <- renderPlot({
      
      samples <- replicate(n = input$num_samples, 
                           expr = mean(rf(n = input$sample_size, df1 = input$df1, df2 = input$df2)))
      
      ggplot(data.frame(x = samples), aes(x = x)) + 
        geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "#028A0F", alpha = 0.5) + 
        geom_density(color = "blue") +
        theme_linedraw()
    })
    
    # Generating Chi-Squared Sample Data and Plot
    output$chi_squared_plot <- renderPlot({
      
      samples <- replicate(n = input$num_samples, 
                           expr = mean(rchisq(n = input$sample_size, df = input$df_chi)))
      
      ggplot(data.frame(x = samples), aes(x = x)) + 
        geom_histogram(aes(y = after_stat(density)), bins = 20, fill = "#028A0F", alpha = 0.5) + 
        geom_density(color = "blue") +
        theme_linedraw()
    })
    
    # Generating Binomial Sample Data and Plot
    output$binomial_plot <- renderPlot({
      
      samples <- replicate(n = input$num_samples, 
                           expr = mean(rbinom(n = input$sample_size, size = input$num_trials, prob = input$prob)))
      
      ggplot(data.frame(x = samples), aes(x = x)) + 
        geom_histogram(aes(y = after_stat(density)), bins = 20, fill = "#028A0F", alpha = 0.5) + 
        geom_density(color = "blue") +
        theme_linedraw()
    })
  })
}

      

 # Run the app
shinyApp(ui = ui, server = server)
