FROM ubuntu:14.10

 
MAINTAINER zuaa "zuaa@163.com"  
RUN apt-get install -y  wget unzip
#get tomcat
RUN mkdir  /opt/tomcat8 -p && cd /opt/tomcat8 &&   wget http://113.106.92.171/tomcat8.zip && unzip tomcat8.zip
#get jdk
RUN mkdir  /opt/jdk -p  && cd /opt/jdk &&   wget http://113.106.92.171/jdk8.zip && unzip jdk8.zip
#get war
RUN cd /opt/tomcat8/webapps/ && wget  http://113.106.92.171/crawl-node-web-1.0.0.zip && mv crawl-node-web-1.0.0.zip  crawl.war
ENV PATH /opt/tomcat8/bin/:$PATH  
ENV JAVA_HOME /opt/jdk/jdk1.8.0_20/
ENV PATH /opt/jdk/jdk1.8.0_20/bin/:$PATH
RUN chmod +x /opt/tomcat8/bin/*  
RUN chmod +x /opt/jdk/jdk1.8.0_20/bin/*  
EXPOSE 8080  
CMD startup.sh
