FROM nginx:stable-alpine
COPY default.nginx /etc/nginx/conf.d/default.conf
COPY index.html /app/static/index.html
EXPOSE 80/tcp
ENTRYPOINT ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]
WORKDIR /usr/share/nginx/html