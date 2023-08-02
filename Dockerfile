FROM openjdk:11 as build
RUN apt update && apt install maven -y
WORKDIR /app/
COPY . .
RUN mvn install


FROM openjdk:11-slim
WORKDIR /app/
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
