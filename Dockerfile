FROM maven:3.8-openjdk-17 AS builder
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src/
RUN mvn package -DskipTests
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /build/target/*.jar app.jar
ENV SPRING_PROFILES_ACTIVE=default
ENV SERVER_PORT=8080
LABEL version="1.0.0" \
      build="2026-01-01" \
      description="Spring Boot app"
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]



