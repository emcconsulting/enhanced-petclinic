FROM tomcat

RUN rm -rf /tomcat/webapps/*

# Set workdir  petclinic
WORKDIR /petclinic-docker


ENV warname = `curl http://10.63.39.117:8081/artifactory/api/storage/libs-snapshot-local/org/springframework/samples/spring-petclinic/1.0.0-SNAPSHOT | grep war | tail -1 | cut -d '"' -f4`

RUN curl -o petclinic.war http://10.63.39.117:8081/artifactory/libs-snapshot-local/org/springframework/samples/spring-petclinic/1.0.0-SNAPSHOT$warname

RUN ls -lhrt

CMD ["catalina.sh", "run"]

ADD  petclinic.war /usr/local/tomcat/webapps/

RUN chmod 777 /usr/local/tomcat/webapps/petclinic.war
