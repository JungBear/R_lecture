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

