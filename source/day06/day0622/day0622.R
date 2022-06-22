library(ggplot2)
library(dplyr)
exam_na = read.csv("exam_na.csv")

# 1. 이파일을 df로 불러온 후에 결측치의 빈도를 확인하고 결측치를 제거한 오존의 평균을 구해보시오
df <- read.csv("ozone.csv")
is.na(df)
table(is.na(df))
mean(!is.na(df))

# 2. ozone 변수에서 결측치를 제외한 데이터들의 중앙값을 구하고, ozone의 결측치에 입력후 전체 오존의 평균을 구해보시오
median(df$ozone, na.rm = T)
df$ozone <- ifelse(is.na(df$ozone), 31.5, df$ozone)
mean(df$ozone)

# 3. df에 ozone.csv 파일을 다시 입력한 후 ozone의 결측치와 극단치를 제외한 데이터들을 새 객체 df1에 입력하고, df1의 평균을 구하시오
df <- read.csv("ozone.csv")
boxplot(df$ozone)$stats
df1 <- ifelse(df$ozone>79|df$ozone<1, NA, df$ozone)
mean(df1, na.rm = T)

# 4. diamonds 데이터세트를 새 객체 diamonds에 입력후 price변수에서 극단치를 결측치로 처리한 후에 cut변수의 범주별 평균 가격을 구하시오
data('diamonds')
force(diamonds)

boxplot(diamonds$price)$stats # 극단치를 구하기위해
# 극단치를 결측치로 처리
diamonds$price <- ifelse(diamonds$price > 11886|
                         diamonds$price<326, 
                         NA, diamonds$price) 
diamonds %>% 
  filter(!is.na(price)) %>% # 결측치 없는 행 추출
  group_by(cut) %>%         # cut범주별 묶음
  summarise(m=mean(price))  

# ggplot 201p~
library(readxl)
who_disease <- read_xlsx("who_disease.xlsx")

library(readxl)
library(ggplot2)
who_disease <- read_xlsx("who_disease.xlsx")

#투명도
ggplot(who_disease, aes(x = year, y = cases)) + 
  geom_point(alpha = 0.1)
#칼라
ggplot(who_disease, aes(x = year, y = cases)) + 
  geom_point(alpha = 0.1, colour = "555555")
ggplot(who_disease, aes(x = year, y = cases)) + 
  geom_point(size = 2)
ggplot(who_disease, aes(x = year, y = cases)) + 
  geom_point(fill = "yellow")

str(iris)
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width,
                 colour = Species,
                 size = Petal.Length,
                 shape = Species)) + 
  geom_point()

library(dplyr)
str(who_disease)
data2 <- who_disease %>%
  filter(region == 'AMR',
         year == 1980,
         disease == 'pertussis',
         cases>0)
ggplot(data2, aes(x= cases)) +
  geom_histogram()
ggplot(data2, aes)


diamonds <- ggplot2::diamonds
#산점도
ggplot(diamonds, aes(x= carat, y=price)) + 
  geom_point()
#막대그래프
ggplot(diamonds,aes(x=cut)) + geom_bar()
#막대그래프(x축에는 범주형변수, y축에는 연속형변수)
ggplot(diamonds,aes(x=cut, y=price)) + geom_bar(stat="identity")

#커널밀도곡선
ggplot(data=diamonds, aes(x=carat))+geom_density()

library(tidyverse)




