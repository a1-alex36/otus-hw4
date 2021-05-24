# минимальный вариант пхп. sudo aa-remove-unknown
# запуск пхп встроенного вебсервер а, проброс портов и кода
FROM php:7.4-fpm-alpine

# RUN apk add --no-cache --virtual .build-deps \

# Install dev dependencies
RUN apk update \
    && apk upgrade --available \
    && apk add --virtual .build-deps \
        git \
        curl \
        wget \
        bash \
        tree

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

#COPY . /var/www/html/
#COPY . /usr/src/myapp
#WORKDIR /usr/src/myapp
#CMD [ "php", "./src/index.php" ]
#CMD [ "php", "-S", "0.0.0.0:8002", "-t", "src/"]
#CMD [ "php", "-S", "0.0.0.0:8002", "-t", "/var/www/html"]
CMD [ "php", "-S", "0.0.0.0:8002", "-t", "/var/www/html/socket/src"]


# docker build -t my-php-app .

# запустит. нельзя редактировать пхп файлы. и надо COPY кода делать
# docker run -d -p 8003:8002 my-php-app

# запустит. можно редактировать пхп файлы.
# docker run -d -p 8003:8002 -v $(pwd)/src:/var/www/html my-php-app

# не канает. запустит и создаст папку /myapp в /var/www/html . но тогда в ней же сервер и надо запускать
# docker run -d --rm -p 8004:8002 -v $(pwd)/src:/var/www/html/myapp my-php-app

# работает по адресу loaclhost:8007. socket типа название проекта можно юзать
# CMD [ "php", "-S", "0.0.0.0:8002", "-t", "/var/www/html/socket/src"]
# docker run -d --rm -p 8007:8002 -v $(pwd):/var/www/html/socket my-php-app

# config.ini