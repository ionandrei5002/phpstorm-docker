FROM ui-base-docker:latest

RUN wget https://download.jetbrains.com/webide/PhpStorm-2019.2.4.tar.gz -O /tmp/PhpStorm-2019.2.4.tar.gz && \
    mkdir /app && \
    cd /app && tar -xvf /tmp/PhpStorm-2019.2.4.tar.gz && \
    mv "/app/`ls /app`" /app/phpStorm

RUN apt update && \
    apt install -y php

USER andrei

CMD ["/bin/bash", "--login", "/app/phpStorm/bin/phpstorm.sh"]
