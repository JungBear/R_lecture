library(dplyr)
library(ggplot2)
install.packages("nycflights13")
library(nycflights13)
install.packages("tidyverse")
library(tidyverse)
class(flights)

filter(flights, month == 1, day == 1)

jan1 <- filter(flights, month == 1, day == 1)

(dec25 <- filter(flights, month == 12, day == 25))

filter(flights, month == 1)
sqrt(2) ^ 2 == 2
1/49*49==1

near(sqrt(2) ^ 2, 2) # 무한자리수는 == 대신 near()사용
near(1/ 49*49,1)




