FROM eclipse-temurin:17-jdk
LABEL maintainer="gb" version="1.1.0" description="Java-ONBUILD"
ENV SERVER_PORT=8080
ONBUILD COPY target/*.jar /app/app.jar
ONBUILD EXPOSE 8080
ONBUILD CMD ["java", "-jar", "/app/app.jar"]

