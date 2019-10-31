FROM openjdk:11

LABEL maintainer="andrey.mikhalchuk@conceptant.com"\
    version="0.1.0" \
    description="This Dockerfile builds builds Atlassian Jira Server from official Atlassian distribution file. You have to accept Atlassian license before using this image." \
    "com.conceptant.vendor"="Conceptant, Inc."

ARG JIRA_VERSION=8.5.0

ENV JIRA_HOME     /var/atlassian/jira
ENV JIRA_INSTALL  /opt/atlassian/jira
ENV X_PROXY_NAME X_PROXY_PORT X_PROXY_SCHEME
ENV X_PATH # alternative path to server.xml

COPY "docker-entrypoint.sh" "/"

RUN set -x && \
    apt-get update && \
    apt-get install --quiet --yes --no-install-recommends libtcnative-1 xmlstarlet && \
    apt-get clean && \
    mkdir -p "${JIRA_HOME}/caches/indexes" && \
    chmod -R 700 "${JIRA_HOME}" && \
    chown -R daemon:daemon "${JIRA_HOME}" && \
    mkdir -p "${JIRA_INSTALL}/conf/Catalina" && \
    curl -Lo /tmp/atlassian.tar.gz https://product-downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-${JIRA_VERSION}.tar.gz && \
    tar xzvf /tmp/atlassian.tar.gz --directory "${JIRA_INSTALL}" --strip-components=1 --no-same-owner && \
    rm /tmp/atlassian.tar.gz && \
    curl -Lo /tmp/mysql-connector.tar.gz "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.tar.gz" && \
    tar xzvf /tmp/mysql-connector.tar.gz --directory "${JIRA_INSTALL}/lib" --strip-components=1 --no-same-owner  "mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar" && \
    rm /tmp/mysql-connector.tar.gz && \
    chmod -R 700 "${JIRA_INSTALL}/conf" && \
    chmod -R 700 "${JIRA_INSTALL}/logs" && \
    chmod -R 700 "${JIRA_INSTALL}/temp" && \
    chmod -R 700 "${JIRA_INSTALL}/work" && \
    chown -R daemon:daemon "${JIRA_INSTALL}" && \
    chmod +x /docker-entrypoint.sh

USER daemon:daemon

EXPOSE 8080
VOLUME ["/var/atlassian/jira", "/opt/atlassian/jira/logs"]
WORKDIR /var/atlassian/jira

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]
