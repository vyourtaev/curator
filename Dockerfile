FROM ubuntu:20.04

LABEL maintainer="VoVa <yourtaev@gmail.com>"

RUN apt-get update -q && apt-get install -qy python3-pip cron
RUN pip3 install -U elasticsearch-curator

COPY curator.cron /etc/cron.d/

RUN chmod 0644 /etc/cron.d/curator.cron
RUN crontab /etc/cron.d/curator.cron
RUN touch /var/log/cron.log

COPY actions.yml curator.yml /etc/curator/
COPY run.sh  /

CMD ["/run.sh"]

