FROM openjdk:8
LABEL author="devopsman 2022"
LABEL Project="MY_SPC"
ADD https://github.com/DevopsMan2022/spring-petclinic.git /springpetclinic.jar
EXPOSE 8080
CMD ["java" , "-jar" , "/springpetclinic.jar" ]