This Docker image runs Atlassian Jira Server Software
# Q&A

**What is Jira?**

Jira is the issue and project tracking software made by Atlassian. You can read about this here: https://www.atlassian.com/software/jira.

**What is Conceptant, Inc.?**

Conceptant, Inc. is a business specializing on healthcare solutions. You can read about us here: http://conceptant.com/

**What is the license for this software**

Atlassian Jira is made and owned by Atlassian and by installing it you're binding yourself to Atlassian's license. Please refer to Atlassian website for more details: https://www.atlassian.com/licensing/jira-software
MIT license only applies to this Dockerfile and other files authored by Conceptant and bundled with this Docker file. It does not refer to any Atlassian or other 3rd party products.
Before using this Dockerfile you must read and agree to Atlassian's license and all applicable terms and conditions. 
The purpose of this Docker image is to help you to install, evaluate and use Atlassian Jira in your dockerized environment.

**Are Conceptant and Atlassian somehow affiliated?**

No, there is no affiliation between Atlassian and Conceptant of any kind.   

**Is this docker image production-ready?**

Yes, this image can be used in production if you properly configure volumes, database and other standard production environment parameters.

**Is this Jira Core or Jira Software version of Jira**

This image is for Jira Software.

# Quick start

```
JIRA_DIR=/data/jira_data # this is the folder where you will persist Jira data and configuration, you can change it
mkdir -p ${JIRA_DIR}
chown daemon:daemon ${JIRA_DIR}
docker run -p 8080:8080 -v ${JIRA_DIR}:/var/atlassian/jira conceptant/atlassian-jira-server
```
You can also run this image behind proxy by configuring these environment parameters: JIRA_PROXY_NAME JIRA_PROXY_PORT JIRA_PROXY_SCHEME. For instance if you terminate SSL on your external server then your command may look like this:
```
docker run -p 8080:8080 -v /data/jira_data:/var/atlassian/jira -e JIRA_PROXY_NAME=jira.yourdomain.com -e JIRA_PROXY_PORT=443 -e JIRA_PROXY_SCHEME=https conceptant/atlassian-jira-server
```
If you're running a fresh Jira install then you may want to use docker-compose with the .yml file in this reposity:
```
docker-compose up -d
```
NOTE:
- Edit docker-compose.yml and add your MySQL password and proxy settings if necessary. Please remove the password from the docker-compose file for security reasons after the first successful run 
- You will need to connect to the mysql server first and set up the database like described here: https://confluence.atlassian.com/adminjiraserver/connecting-jira-applications-to-mysql-5-7-966063305.html. Then you can continue with configuring Jira