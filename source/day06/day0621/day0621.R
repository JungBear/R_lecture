getwd()
# mpg1.csv 파일 불러오기
mpg1 <- read.csv("mpg1.csv", stringsAsFactors = F )# 문자열을 factor로 바꾸는 것을 False 한다
str(mpg1)

## 통계 기본 
mean(mtcars$mpg) #평균
var(mtcars$mpg) #분산
sd(mtcars$mpg) #표준편차
quantile(mtcars$mpg) #사분위수
IQR(mtcars$mpg) #1~3분위 범위
summary(iris) # 요약
summary(iris$Sepal.Length)

# 빈도 분석
# 범주별 빈도 -> 문자
str(mpg1)
table(mpg1$trans)
table(mpg1$manufacturer)
table(mpg1$trans, mpg1$manufacturer) #교차분석

#빈도의 비율
a <- table(mpg1$trans)
prop.table(a)

b <- table(mpg1$trans, mpg1$drv)

prop.table(b, margin = 1) #행의 합이 1이 되도록
prop.table(b, margin = 2) #열의 합합이 1가 되도록

round(0.32123141, 2)

round(prop.table(table(mpg1$trans)), 4)

#ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

#데이터 가공
install.packages("dplyr")
library(dplyr)

mpg1 <- read.csv("mpg1.csv", stringsAsFactors = F)

data2 <- mpg1 %>%
    select(drv, cty, hwy)

data3 <- select(mpg1, drv, cty, hwy)
data3

# mutate : 파생변수(원래있던 변수들을 이용해서 만들기)

#변수이름바꾸기
#데이터세트 <- 데이터세트 %>% rename(새 변수이름1=기존이름1                                        새 변수이름2=기존이름2)
mpg1_rewname1 <- mpg1 %>%
    rename(transmission=trans,
           drive_nethod=drv,
           city=cty,
           highway=hwy)

#빈도분석
#count(데이터세트, 변수)
#table(데이터세트$변수)
count(mpg1, trans) #데이터유형은 데이터프레임
class(count(mpg1, trans))
table(mpg1$trans)
class(table(mpg1$trans))#데이터유형은 테이블

#불필요한 열빼고 필요한 열만 남기기
#객체 <- 데이터세트 %>% select(-c(열1,열2))
mpg1_type1 <- mpg1 %>% select(-c(cty,hwy))

#행 추출(slice())
mpg1 %>% slice(1,4,5)

#조건에 맞는 행 추출(filter())
mpg1 %>% filter(manufacturer=="hyundai") %>% glimpse()
#조건모두 만족 &
mpg1 %>% filter(manufacturer=="hyundai" & cty>=16.85897)
#조건중 하나라도 만족 |

#열을 추출 후 조건에 맞는 행 추출
data4<- mpg1 %>%
  select(manufacturer, cty) %>%
  filter(manufacturer=="hyundai" & cty>=16.85897 )

#파생변수 만들기
mpg2 <- mpg1 %>%
    mutate(total=cty+hwy)

#복수의 파생변수 만들기
mpg3 <- mpg1 %>%
  mutate(total=cty+hwy,
    mean=(cty+hwy)/2)

#데이터 미리보기
glimpse()

iris %>%
  filter(Species == "setosa") %>% glimpse()

#집단별 통계량
# group_by() + summarise()는 세트
mpg1 %>%
  group_by(trans) %>%
  summarise(avg     = mean(cty)   
            , total = sum(cty)
            , med   = median(cty))

#복수변수를 집단 분류해서 통계 구하기
mpg1 %>% group_by(trans, drv) %>%
  summarise(m=mean(cty))

#분류 집단별 데이터 빈도 구하기
mpg1 %>%
  group_by(trans, drv) %>%
  summarise(n=n(),        #count를 써도된다 = count()
            avg=mean(cty))

#분류한 집단별 빈도와 비율 구하기
mpg1 %>%
  group_by(trans) %>%    # trans 범주로 분류
  summarise(n=n()) %>%   # trans 범주별 데이터 빈도 구하기
  mutate(total=sum(n),   # trans 범주별 빈도의 총계 구하기
         pct=n/total*100)# trans 범주별 비율 구하기
    

library(ggplot2)
data()
data('diamonds')
diamonds %>% 
  group_by(cut) %>%
  summarise(cut_avg=mean(price)) 




