# Pull base image.
FROM dehy/php:5.3-apache

# Installing NodeJS, npm and less

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
RUN update-alternatives --install /usr/local/bin/node nodejs /usr/bin/nodejs 100
RUN curl https://www.npmjs.com/install.sh | sh
RUN npm install less -g

ADD virtual-host.conf /etc/apache2/sites-available/default
ADD configure-symfony-app.sh /usr/local/bin/configure-symfony-app.sh
RUN chmod +x /usr/local/bin/configure-symfony-app.sh

ENV ENABLE_APACHE_MODULES rewrite
ENV ENABLE_PHP_MODULES mysql intl curl

CMD ["/usr/local/bin/configure-symfony-app.sh"]
