FROM php:7-cli

RUN apt-get -y update \
  && apt-get install -y curl \
  && apt-get install -y git \
  && apt-get install -y unzip

RUN mkdir /home/user && useradd user && chown -R user /home/user

RUN mkdir /home/user/phan \
  && cd /home/user \
  && git clone https://github.com/etsy/phan.git

COPY install_composer.sh /tmp
RUN chmod +x /tmp/install_composer.sh
RUN /tmp/install_composer.sh || exit 0

COPY install_ast.sh /tmp
RUN chmod +x /tmp/install_ast.sh
RUN /tmp/install_ast.sh

RUN cd /home/user/phan \
  && chown -R user . \
  && su user -c "/composer.phar install" \
  && ./test
