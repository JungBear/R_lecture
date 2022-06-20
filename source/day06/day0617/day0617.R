#패키지 설치
install.packages("ggplot2")
library(ggplot2) #패키지정의

# 통계 = 데이터
# iris
str(iris) #객체함수정의
help(str) #도움말= $?str

ggplot(data= iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() #그래프종류
