FROM java:8

RUN mkdir /home/zuaa; cd /home/zuaa ; wget http://192.168.3.161:7080/nexus/content/repositories/releases/com/gecpp/service/crawl-node/2.0.0/crawl-node-2.0.0-onejar.jar ; mv crawl-node-2.0.0-onejar.jar crawl-node.jar ;
RUN cd /home/zuaa; echo "task_url=ws://113.106.92.172:8089/crawl-server/ws" >>system.properties ;echo "mq_host=tcp://113.106.92.172:61616" >>system.properties ;echo "send_queue_name=batch_updated " >>system.properties  ;echo "mq_username=crawl-user" >>system.properties ;echo "mq_password=crawl1234" >>system.properties ;echo "client_key=lhp1" >>system.properties ;echo "thread_qty=50" >>system.properties;


CMD ["java","-jar","/home/zuaa/crawl-node.jar","profile=/home/zuaa/system.properties"]

