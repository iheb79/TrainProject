FROM maven:3.8.4-openjdk-11-slim AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/ExamThourayaS2.jar .
CMD ["java", "-jar", "ExamThourayaS2.jar"]
