FROM desktop:guacd as guacd
FROM guacamole/guacamole:1.5.2 as guacamole
FROM desktop:xrdp

# Copiar guacamole, tomcat e guacd
COPY --from=guacamole /opt/guacamole/ /opt/guacamole
COPY --from=guacamole /usr/local/tomcat /usr/local/tomcat
COPY --from=guacd /opt/guacamole/ /opt/guacamole

# Configurações do Tomcat
ENV PATH "$PATH:/usr/local/tomcat/bin"
ENV CATALINA_BASE "/usr/local/tomcat"
ENV CATALINA_HOME "/usr/local/tomcat"
ENV CATALINA_TMPDIR "/usr/local/tomcat/temp"
ENV TZ "UTC"

# Instalar dependências do guacamole
RUN apt-get update \
    && apt-get install -y libcairo2 libjpeg-turbo8 xmlstarlet unzip tini default-jre-headless nano supervisor curl  \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Configurar MariaDB
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server pwgen gosu tzdata  \
  && curl https://raw.githubusercontent.com/MariaDB/mariadb-docker/master/10.6/docker-entrypoint.sh > /usr/bin/mariadb-docker \
  && chmod a+x /usr/bin/mariadb-docker \
  && rm -rf /var/lib/mysql \
  && mkdir -p /var/lib/mysql /var/run/mysqld \
  && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
  && chmod 777 /var/run/mysqld\
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Copiar arquivos padrões
COPY ./files /

# Criar usuário
RUN useradd alan -m \
  && echo 'alan:alan' | chpasswd

# Senha do root
RUN echo 'root:root' | chpasswd

# Comandos de inicialização
ENTRYPOINT ["tini", "--"]
CMD supervisord