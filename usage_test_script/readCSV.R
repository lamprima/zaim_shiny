library(xts)

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
input_df <- read.csv("zaim/Zaim.20171119160555_SJIS.csv", encoding = "UTF-8")

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


rec_count#}
is.na(internal$data.month[rec_count-1])
internal$data.month[rec_count-1]
income_array
names(income_array) <- month_num
income_array
barplot(income_array)
barplot(outcome_array)

  #CSVファイルを出力
write.csv(internal, "internal/internal.csv",  fileEncoding = "CP932")



