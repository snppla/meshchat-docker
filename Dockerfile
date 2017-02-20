from debian

RUN apt-get -y update && apt-get upgrade

RUN apt-get install -y git curl apache2 binutils

WORKDIR /root

RUN git clone https://github.com/tpaskett/meshchat.git

WORKDIR /root/meshchat

RUN sed -i 's|.*$pi_zone.*|our $pi_zone = $ENV{"ZONE"};|' src/pi/data/www/cgi-bin/meshchatconfig.pm
RUN sed -i 's|.*$local_meshchat_node.*|our $local_meshchat_node  = $ENV{"LOCAL_NODE"};|' src/pi/data/www/cgi-bin/meshchatconfig.pm

RUN ./build
RUN dpkg -i meshchat_1.0_all.deb

EXPOSE 80

ENV ZONE=MeshChat
ENV LOCAL_NODE=localnode

VOLUME ["/var/www/html/meshchat/db/"]

CMD echo nameserver $LOCAL_NODE > /etc/resolv.conf && apache2ctl start && meshchatsync
