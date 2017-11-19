
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Sample Program"),
  
  navbarPage("Navbar",
             
    tabPanel("Input",           

      # Sidebar with a slider input for number of bins
      sidebarLayout(
        sidebarPanel(
          # Input: Select a file ----
          fileInput("file1", "ファイル選択",
                    multiple = TRUE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv")),
     
          # Horizontal line ----
          tags$br(),
      
          # Input: Select a file ----
          fileInput("file2", "Choose CSV File2",
                    multiple = TRUE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv")),
          # Horizontal line ----
          tags$hr(),
      
          # Input: Select a file ----
           fileInput("file3", "Choose CSV File3",
                    multiple = TRUE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv")),
      
          # Horizontal line ----
          tags$hr(),
      
          # Input: Select a file ----
          fileInput("file4", "Choose CSV File4",
                    multiple = TRUE,
                   accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
          # Horizontal line ----
          tags$hr(),
      
          # Input: Select a file ----
          fileInput("file5", "Choose CSV File5",
                    multiple = TRUE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv")),
          # Horizontal line ----
          tags$hr(),
      
          # Input: Select a file ----
          fileInput("file6", "Choose CSV File6",
                    multiple = TRUE,
                    accept = c("text/csv",
                               "text/comma-separated-values,text/plain",
                               ".csv"))
          ),
    


        # Show a plot of the generated distribution
        mainPanel(
      
          tabsetPanel(
        
            tabPanel("Contents",tableOutput("contents"))
        
          )
     
        )#mainPanel
      )#slidebarLayout
    ),#tabPanel
    tabPanel("Action",
      sidebarLayout(
             
        sidebarPanel(
         # column(6,
          #       dateRangeInput("dates", "date_range", start = Sys.Date(), end = Sys.Date()+10))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
          column(6,
                 dateRangeInput("dates", "date_range", start = Sys.Date(), end = Sys.Date()+10))
        )#mainPanel
               
      )#slidebarLayout
    ),#tabPanel
    
    tabPanel("Output",
             # Sidebar layout with input and output definitions ----
      sidebarLayout(
               
         # Sidebar panel for inputs ----
         sidebarPanel(
                 
           # Input: Choose dataset ----
           selectInput("dataset", "Choose a dataset:",
                       choices = c("rock", "pressure", "cars")),
                 
             # Button
             downloadButton("downloadData", "Download")
                 
         ),#sidebarPanel
               
         # Main panel for displaying outputs ----
         mainPanel(
                 
           #tableOutput("table")
           plotOutput("plot_income"),
           plotOutput("plot_outcome"),
           plotOutput("plot_income_circle")
           
                        
         )# MainPanel
               
       )# SidebarLayout
      
    )# tabPanel 
  
  )#navbar
    
))#fruid page
