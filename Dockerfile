FROM java:8
ENV CNAME  docker
ENV JARVERSION 2.0.5
ENV HOST 113.106.92.172:8089
ENV MQHOST 113.106.92.172
ENV MQPS crawl1234
ENV MQU crawl-user
#ENV JARHOST  http://113.106.92.165/crawl-node-$JARVERSION-onejar.jar 

ENV JARHOST  http://192.168.3.161:7080/nexus/content/repositories/releases/com/gecpp/service/crawl-node/$JARVERSION/crawl-node-$JARVERSION-onejar.jar
RUN mkdir /home/zuaa; cd /home/zuaa ; wget $JARHOST; mv crawl-node-$JARVERSION-onejar.jar crawl-node.jar ;


RUN cd /home/zuaa;echo  "client_key=$CNAME" >> /home/zuaa/system.properties;   echo "task_url=ws://$HOST/crawl-server/ws" >>system.properties ;echo "mq_host=tcp://$MQHOST:61616" >>system.properties ;echo "send_queue_name=batch_updated" >>system.properties  ;echo "mq_username=$MQU" >>system.properties ;echo "mq_password=$MQPS" >>system.properties ;echo "thread_qty=50" >>system.properties;
CMD ["java","-jar","/home/zuaa/crawl-node.jar","profile=/home/zuaa/system.properties"]





