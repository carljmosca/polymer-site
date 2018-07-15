FROM centos:7

RUN yum install -y epel-release git gcc-c++ make httpd
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN yum install -y nodejs yarn

RUN npm i npm@4 -g
RUN npm install -g polymer-cli

RUN usermod -l apache2 apache
RUN chmod g=u /etc/passwd

COPY image/startup.sh /usr/local/bin/startup.sh
RUN chmod 755 /usr/local/bin/startup.sh && \
    chmod 775 /run/httpd && \
    chmod -R 775 /var/log/httpd

RUN sed -i 's/Listen 80/Listen 8000/g' /etc/httpd/conf/httpd.conf

ENTRYPOINT [ "/usr/local/bin/startup.sh" ]

#USER 1001