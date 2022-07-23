FROM openjdk:8
LABEL author="Manohar"
LABEL Project="MY_SPC"
ADD https://github.com/DevopsMan2022/spring-petclinic.git /springpetclinic.jar
#ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /springpetclinic.jar
EXPOSE 8080
CMD ["java" , "-jar" , "/springpetclinic.jar" ]