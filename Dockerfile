FROM debian
MAINTAINER Alexis Pereda <alexis@pereda.fr>

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="1.0"
LABEL description="CRON server"

RUN apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
		ca-certificates cron curl procps rsyslog \
	&& rm -rf /var/lib/apt/lists/*

COPY --from=docker /usr/local/bin/* /usr/local/bin/

ADD ./etc /etc
COPY ./entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
