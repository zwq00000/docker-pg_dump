FROM postgres:13
#Previously Cristoffer Fairweather <cfairweather@annixa.com>
#Previously Bruno Luiz <contact@brunoluiz.net>
LABEL AUTH="zhao weiqiang <zwq00000@hotmail.com>" 

RUN apt-get update && \
    apt-get install -y cron && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD dump.sh /dump.sh
RUN chmod +x /dump.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /dump

ENTRYPOINT ["/start.sh"]
CMD [""]
