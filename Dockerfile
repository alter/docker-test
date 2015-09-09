FROM debian
MAINTAINER Roman Dolgov "alter.pub+docker@gmail.com"
CREATED_AT 2015-09-09_18:47
ADD html.conf /etc/nginx/sites-available/
RUN DEBIAN_FRONTEND=noninteractive apt-get update &&  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y nginx && mkdir -p /var/www/html
RUN ln -s /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/01_html
ADD index.html /var/www/html/
EXPOSE 80
ENTRYPOINT ["/bin/bash"]
