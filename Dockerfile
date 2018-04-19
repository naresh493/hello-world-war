FROM tomcat:9.0-alpine
LABEL version = "1.1.3"
//COPY target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/hello-world-war-1.0.0.war
COPY hello-world-war-1.0.0.war /usr/local/tomcat/webapps/hello-world-war-1.0.0.war