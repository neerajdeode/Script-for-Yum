#!/bin/bash

# Script to configure yum repository
# This script will install createrepo by resolving it's dependent dependency 
# and will create new.repo file for repo configuration

# Prerequisites: 
#		Copy "Packages" folder from Linux ISO to /root/Desktop/
#		Provide correct execute permission to scipt

#Below 3 commands will install createrepo via rpm
#deltarpm* and python-deltarpm* are dependencies of createrepo
rpm -ih /root/Desktop/Packages/deltarpm*
rpm -ih /root/Desktop/Packages/python-deltarpm*  
rpm -ivh /root/Desktop/Packages/createrepo*

#Below command will create repomd.xml file in /root/Desktop/Packages
createrepo /root/Desktop/Packages/

#Below commands will create new.repo file and configure it to use repomd.xml
touch /etc/yum.repos.d/new.repo
echo "[new]" > /etc/yum.repos.d/new.repo
echo "name=new" >> /etc/yum.repos.d/new.repo
echo "baseurl=file:///root/Desktop/Packages" >> /etc/yum.repos.d/new.repo
echo "gpgcheck=0" >> /etc/yum.repos.d/new.repo
echo "enabled=1" >> /etc/yum.repos.d/new.repo

#Below commands will update yum 
yum update
yum repolist
