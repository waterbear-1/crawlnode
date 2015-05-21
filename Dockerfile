FROM ubuntu:14.10

# Pull base image  

MAINTAINER zuaa "zuaa@163.com"

# update source  
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# Install curl  
RUN apt-get -y install curl

# Install JDK 8 
RUN cd /tmp &&  curl -L 'https://edelivery.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz
RUN mkdir -p /usr/lib/jvm
RUN mv /tmp/jdk1.8.0_45/ /usr/lib/jvm/java-8-oracle/

# Set Oracle JDK 8 as default Java  
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/bin/java 300
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-oracle/bin/javac 300

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/

# Install tomcat7  
RUN cd /tmp && curl -L 'http://ftp.riken.jp/net/apache/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz' | tar -xz
RUN mkdir -p /opt/tomcat8
RUN mv /tmp/apache-tomcat-8.0.22 /opt/tomcat8
#ENV CATALINA_HOME /opt/tomcat8/apache-tomcat-8.0.22 
#ENV PATH $PATH:$CATALINA_HOME/bin  

#ADD tomcat8 /etc/init.d/tomcat8  
#RUN chmod 755 /etc/init.d/tomcat8  
RUN chmod +x /opt/tomcat8/apache-tomcat-8.0.22/bin/
# Expose ports.  
EXPOSE 8080
ENV PATH /opt/tomcat8/apache-tomcat-8.0.22/bin/:$PATH
# Define default command.  
CMD startup.sh
