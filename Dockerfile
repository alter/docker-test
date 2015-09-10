FROM debian
MAINTAINER Roman Dolgov "alter.pub+docker@gmail.com"
RUN DEBIAN_FRONTEND=noninteractive apt-get update &&  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install dpkg -y && mkdir -p /var/www/html && rm -f /etc/nginx/sites-enabled/default
ADD nginx-at.deb /
RUN dpkg -i /nginx-at.deb
ADD index.html /var/www/html/
ADD html.conf /etc/nginx/sites-available/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN ln -s /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/01_html
CMD service nginx start
EXPOSE 80
