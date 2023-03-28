FROM maven:3.8.1-jdk-8-slim as builder

# Copy local code to the container image.
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build a release artifact.
RUN mvn clean package -Dmaven.test.skip=true

# Run the web service on container startup.
ENTRYPOINT ["java","-jar","/app/target/demo1-0.0.1-SNAPSHOT.jar"]
