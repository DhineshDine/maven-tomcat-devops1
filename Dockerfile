FROM tomcat:9.0
EXPOSE 8080

COPY target/Maven-Web-App.war /usr/local/tomcat/webapps/
