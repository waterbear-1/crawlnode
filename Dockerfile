FROM java:8
#ENV JARHOST  http://113.106.92.165/crawl-node-$JARVERSION-onejar.jar 



RUN git clone https://github.com/waterbear-1/crawlnode.git  /home/xuping/crawl;


CMD ["java","-jar","/home/zuaa/crawl/crawl-onejar.jar","profile=/home/zuaa/crawl/system.properties"]





