# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "naresh.bogathi@capgemini.com">

# Copy to images tomcat path
ADD hello-world-war-1.0.0.war /usr/local/tomcat/webapps/
