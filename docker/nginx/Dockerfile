FROM --platform=linux/amd64 nginx:alpine

RUN echo "upstream php-upstream { server php-fpm:9000; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

COPY ./sites/site.conf /etc/nginx/conf.d/site.conf

CMD ["nginx", "-g", "daemon off;"]