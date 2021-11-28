FROM httpd:2.4
COPY ./public_html/ /usr/local/apache2/htdocs/


FROM python:3.8-buster
RUN apt-get update
RUN adduser myuser
USER myuser
WORKDIR /home/myuser
ENV PATH="/home/myuser/.local/bin:${PATH}"
COPY --chown=myuser:myuser . .
RUN pip install --upgrade pip setuptools wheel