FROM tomcat:latest
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
COPY ./webapp.war /usr/local/tomcat/webapps
