FROM debian:buster-slim
ENV TZ "Europe/Berlin"
RUN apt-get update && apt-get install -qy php-cli composer iputils-ping && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD . /usr/local/hostmanager
RUN chmod +x /usr/local/hostmanager/bashrc.sh && echo "source /usr/local/hostmanager/bashrc.sh" >> /root/.bashrc
RUN echo "[PHP]\nvariables_order = \"EGPCS\"" >> /etc/php/7.3/cli/conf.d/zzz-custom.ini
ADD ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN composer install --no-interaction --no-dev --prefer-dist --working-dir=/usr/local/hostmanager
ENTRYPOINT ["entrypoint.sh"]
