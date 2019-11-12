FROM codefresh/cli

#RUN apk add --no-cache git bash

COPY ./start.sh /run/start.sh
RUN chmod +x /run/start.sh

CMD ["/run/start.sh"]