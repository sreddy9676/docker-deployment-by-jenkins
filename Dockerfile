FROM tomcat:8.0

RUN apt-get update && apt-get install -y vim

ADD myweb-8.1.0.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
