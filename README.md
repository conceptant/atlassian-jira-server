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
mkdir /data/jira_data # this is the folder where you will persist Jira data and configuration
docker run -p 8080:8080 -v /data/jira_data:/var/atlassian/jira conceptant/atlassian-jira-server
```
You can also run this image behind proxy by configuring these environment parameters: X_PROXY_NAME X_PROXY_PORT X_PROXY_SCHEME
