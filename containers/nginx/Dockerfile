FROM nginx:1.11.7

COPY generate_certificate.sh /etc/nginx/generate_certificate.sh
WORKDIR /etc/nginx
RUN ./generate_certificate.sh
COPY nginx.conf /etc/nginx/nginx.conf
