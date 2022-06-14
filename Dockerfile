FROM sapmachine:11
LABEL maintainer="contact@p3ter.fr"

RUN apt update && apt install -y curl maven
RUN mkdir /opt/cxcommcli
COPY CXCOMMCLI00P_6-80005133/ /opt/cxcommcli/

ENV PATH="${PATH}:/opt/cxcommcli/bin"

ENTRYPOINT "/bin/bash"
