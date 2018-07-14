FROM bitnami/minideb:jessie

RUN apt-get update -y
RUN apt-get install -y npm git apache2

# RUN npm install -g polymer-cli

COPY image/startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

CMD [ "/usr/local/bin/startup.sh" ]