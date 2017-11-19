
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  #output$distPlot <- renderPlot({
   output$contents <- renderTable({
     
     #req(input$file1)
     
     input_df <- read.csv(input$file1$datapath,
                    header = T)
     
     
     
     #不要な列を削除
     input_df <- input_df[, c(1, 3, 4, 11, 12)]
     
     #列名の付け替え
     colnames(input_df) <- c("date", "category","genre","income","outcome")
     
     input_df

    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2]
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')

   })
   
   output$plots <- renderPlot({
     
     df1 <- read.csv(input$file1$datapath,
                     header = T)
     
     df1.1 <- df1[ , 2]
     
     #plot(df1.1,
    #      main = paste("r", dist, "(", n, ")", sep = ""),
    #      col = "#75AADB", border = "white")
     
     
   })

   output$plot_income <- renderPlot({
     
     #月の添え字
     m <- 1
     #行の添え字
     rec_count <- 1
     month <- c("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月")
     month_num <- c(1:12)
     
     
     #月毎の収入・支出を格納するベクトルを宣言
     income_array <- numeric(12)
     outcome_array <- numeric(12)
     
     #ファイルを読み込む
     input_df <- read.csv(input$file1$datapath,
                          header = T, encoding = "UTF-8")
     
     #不要な列を削除
     input_df <- input_df[, c(1, 3, 4, 11, 12)]
     
     #列名の付け替え
     colnames(input_df) <- c("date", "category","genre","income","outcome")
     
     data.year <- format(as.Date(input_df$date),"%Y")
     data.month <- months(as.Date(input_df$date))
     
     internal <- data.frame(input_df, data.year, data.month)
     
     #come <- function(){
     #月ループ
     while(m < 13){
       
       while(m < m + 1){
         
         #行ループ
         if(internal$data.month[rec_count] == month[m]){
           
           #月毎の収入
           income_array[m] <- income_array[m] + internal$income[rec_count]
           
           #対象行を1行進める
           rec_count <- rec_count + 1
           
           if(is.na(internal$data.month[rec_count]))break
           
         }else{
           
           break
           
         }
         
       }#while
       
       #月を1つ進める
       m <- m + 1
       
       if(is.na(internal$data.month[rec_count]))break
       
       
     }#for
    
     names(income_array) <- month_num
    
      #グラフの描画
     barplot(income_array,names.arg=c("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"),
             col=c("blueviolet", "purple", "violetred", "pink","pink2", "red","orange","yellow", "greenyellow","green","lightseagreen","green4"),
             main="月別収入グラフ", xlab="月", ylab="収入",
             ylim=c(0,300000), axis.lty=1, las=1, font.main=15,
             font.lab=10, font=10, cex.main=3, cex.lab=1.2,
             cex.names=1.2, cex.axis=1.2)
     
   })
   
   output$plot_outcome <- renderPlot({
     
     #月の添え字
     m <- 1
     #行の添え字
     rec_count <- 1
     month <- c("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月")
     month_num <- c(1:12)
     
     
     #月毎の収入・支出を格納するベクトルを宣言
     income_array <- numeric(12)
     outcome_array <- numeric(12)
     
     #ファイルを読み込む
     input_df <- read.csv(input$file1$datapath,
                          header = T, encoding = "UTF-8")
     
     #不要な列を削除
     input_df <- input_df[, c(1, 3, 4, 11, 12)]
     
     #列名の付け替え
     colnames(input_df) <- c("date", "category","genre","income","outcome")
     
     data.year <- format(as.Date(input_df$date),"%Y")
     data.month <- months(as.Date(input_df$date))
     
     internal <- data.frame(input_df, data.year, data.month)
     
     #come <- function(){
     #月ループ
     while(m < 13){
       
       while(m < m + 1){
         
         #行ループ
         if(internal$data.month[rec_count] == month[m]){
           
           #月毎の支出
           outcome_array[m] <- outcome_array[m] + internal$outcome[rec_count]
           
           #対象行を1行進める
           rec_count <- rec_count + 1
           
           if(is.na(internal$data.month[rec_count]))break
           
         }else{
           
           break
           
         }
         
       }#while
       
       #月を1つ進める
       m <- m + 1
       
       if(is.na(internal$data.month[rec_count]))break
       
       
     }#for
     
     names(outcome_array) <- month_num
     
     #グラフの描画
     barplot(outcome_array,names.arg=c("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"),
             col=c("blueviolet", "purple", "violetred", "pink","pink2", "red","orange","yellow", "greenyellow","green","lightseagreen","green4"),
             main="月別支出グラフ", xlab="月", ylab="支出",
             ylim=c(0,300000), axis.lty=1, las=1, font.main=15,
             font.lab=10, font=10, cex.main=3, cex.lab=1.2,
             cex.names=1.2, cex.axis=1.2)
     
   })
   
   output$plot_income_circle <- renderPlot({
     
     #月の添え字
     m <- 1
     #行の添え字
     rec_count <- 1
     month <- c("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月")
     month_num <- c(1:12)
     
     
     #月毎の収入・支出を格納するベクトルを宣言
     income_array <- numeric(12)
     outcome_array <- numeric(12)
     
     #ファイルを読み込む
     input_df <- read.csv(input$file1$datapath,
                          header = T, encoding = "UTF-8")
     
     #不要な列を削除
     input_df <- input_df[, c(1, 3, 4, 11, 12)]
     
     #列名の付け替え
     colnames(input_df) <- c("date", "category","genre","income","outcome")
     
     data.year <- format(as.Date(input_df$date),"%Y")
     data.month <- months(as.Date(input_df$date))
     
     head(data.year)
     
     internal <- data.frame(input_df, data.year, data.month)
     
     #come <- function(){
     #月ループ
     while(m < 13){
       
       while(m < m + 1){
         
         #行ループ
         if(internal$data.month[rec_count] == month[m]){
           
           #月毎の収入
           income_array[m] <- income_array[m] + internal$income[rec_count]
           
           #対象行を1行進める
           rec_count <- rec_count + 1
           
           if(is.na(internal$data.month[rec_count]))break
           
         }else{
           
           break
           
         }
         
       }#while
       
       #月を1つ進める
       m <- m + 1
       
       if(is.na(internal$data.month[rec_count]))break
       
       
     }#for
     
     names(income_array) <- month_num
     
     #グラフの描画
     ggplot(as.data.frame(income_array))
     
   })
   
   # Downloadable csv of selected dataset ----
   output$downloadData <- downloadHandler(
     filename = function() {
      paste(input$dataset, ".csv", sep = "")
      #paste(df1, ".csv", sep = "")
       },
     
     # datasetInput() is data.frame
     content = function(file) {
       write.csv(datasetInput(), file, row.names = FALSE)
     
     }
   )
     
})
   