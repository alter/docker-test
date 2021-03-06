FROM localhost:4000/ubuntu:12.04
MAINTAINER Roman Dolgov "alter.pub+docker@gmail.com"
RUN DEBIAN_FRONTEND=noninteractive apt-get install gdebi wget aptitude -y && mkdir -p /var/www/html && rm -f /etc/nginx/sites-enabled/default
RUN wget itsb.pro/nginx-at.deb -O /tmp/nginx-at.deb && gdebi --n /tmp/nginx-at.deb
ADD index.html /var/www/html/
ADD html.conf /etc/nginx/sites-available/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN ln -s /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/01_html
CMD service nginx start
EXPOSE 80
