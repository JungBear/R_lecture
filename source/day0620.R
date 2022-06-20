num_vector = c(1, 2, 3)
num_vector2 = c(5, 6, 7)
d= factor(c(1, 2, 3))# 범주형
e= c("hi","hello")# 문자열

num_vector[2] + num_vector[3]

a= c(1, 2, 3)
b= factor(c(1, 2, 3))
c= c("a")
a*3
b*3

e[2]
class() # 벡터의 유형

a= c("TRUE", 1)
class(a)

a= factor(c(TRUE, 1))
class(a)

# 명목형 자료형 Factor
locaiton_vector <- c("서울", "인천", "부산")
factor_location_vector <- factor(locaiton_vector)
factor_location_vector

class(factor_location_vector)
help(factor)

# 순서형 자료형 Factor
temperature_factor <- c("기온높음", 
                        "기온보통", 
                        "기온낮음", 
                        "기온높음", 
                        "기온보통", 
                        "기온보통")

temperature_factor

factor_temperature_factor <- factor(temperature_factor, 
                                    ordered = TRUE, 
                                    levels  = c("기온보통", 
                                                "기온낮음", 
                                                "기온높음"))
factor_temperature_factor
class()

##데이터 프레임 - 엑셀 데이터
no= c(1, 2, 3, 4, 5)
sex= c("male", "female", "male", "male", "female")
korean= c(87, 92 , 95, 81, 87)

exam = data.frame(no, sex, korean)
exam

exam$korean
exam$korean[2]

class(exam$sex)

str(exam)



  
