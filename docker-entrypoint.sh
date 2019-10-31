#!/bin/sh

if [ "$(stat --format "%Y" "${JIRA_INSTALL}/conf/server.xml")" -eq "0" ]; then
  if [ -n "${JIRA_PROXY_NAME}" ]; then
    xmlstarlet ed --inplace --pf --ps --insert '//Connector[@port="8080"]' --type "attr" --name "proxyName" --value "${JIRA_PROXY_NAME}" "${JIRA_INSTALL}/conf/server.xml"
  fi
  if [ -n "${JIRA_PROXY_PORT}" ]; then
    xmlstarlet ed --inplace --pf --ps --insert '//Connector[@port="8080"]' --type "attr" --name "proxyPort" --value "${JIRA_PROXY_PORT}" "${JIRA_INSTALL}/conf/server.xml"
  fi
  if [ -n "${JIRA_PROXY_SCHEME}" ]; then
    xmlstarlet ed --inplace --pf --ps --insert '//Connector[@port="8080"]' --type "attr" --name "scheme" --value "${JIRA_PROXY_SCHEME}" "${JIRA_INSTALL}/conf/server.xml"
  fi
  if [ -n "${JIRA_SERVER_XML_PATH}" ]; then
    xmlstarlet ed --inplace --pf --ps --update '//Context/@path' --value "${JIRA_SERVER_XML_PATH}" "${JIRA_INSTALL}/conf/server.xml"
  fi
fi

exec "$@"
