FROM ubuntu/apache2:latest
RUN rm -rf /var/www/html/*
WORKDIR /var/www/html
COPY register.html index.html
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
EXPOSE 80
