FROM debian
MAINTAINER Roman Dolgov "alter.pub+docker@gmail.com"
ADD html.conf /etc/nginx/sites-available/
RUN DEBIAN_FRONTEND=noninteractive apt-get update &&  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install dpkg -y && mkdir -p /var/www/html && rm -f /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/01_html
ADD index.html /var/www/html/
ADD nginx-at_1.8.x-1_amd64.deb /
RUN dpkg -i /nginx-at_1.8.x-1_amd64.deb
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
CMD service nginx start
EXPOSE 80
