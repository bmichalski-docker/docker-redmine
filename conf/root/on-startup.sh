#!/bin/bash

VHOST_CONFIGURATION_FILE=/opt/nginx/conf/vhost/default

sudo sed -i "s/__REDMINE_WEB_HOST__/${REDMINE_WEB_HOST}/"                   $VHOST_CONFIGURATION_FILE
sudo sed -i "s/__REDMINE_WEB_PORT__/${REDMINE_WEB_PORT}/"                   $VHOST_CONFIGURATION_FILE

sudo sed -i "s/__REDMINE_DATABASE_HOST__/${REDMINE_DATABASE_HOST}/"         $VHOST_CONFIGURATION_FILE
sudo sed -i "s/__REDMINE_DATABASE_NAME__/${REDMINE_DATABASE_NAME}/"         $VHOST_CONFIGURATION_FILE
sudo sed -i "s/__REDMINE_DATABASE_USERNAME__/${REDMINE_DATABASE_USERNAME}/" $VHOST_CONFIGURATION_FILE
sudo sed -i "s/__REDMINE_DATABASE_PASSWORD__/${REDMINE_DATABASE_PASSWORD}/" $VHOST_CONFIGURATION_FILE
sudo sed -i "s/__REDMINE_DATABASE_ENCODING__/${REDMINE_DATABASE_ENCODING}/" $VHOST_CONFIGURATION_FILE

sudo sed -i "s/__REDMINE_SECRET_TOKEN__/${REDMINE_SECRET_TOKEN}/"           $VHOST_CONFIGURATION_FILE
sudo sed -i "s/__REDMINE_SECRET_KEY_BASE__/${REDMINE_SECRET_KEY_BASE}/"     $VHOST_CONFIGURATION_FILE

cd /opt/redmine/redmine && \
sudo chown -R redmine:redmine files log && \
sudo chmod -R 755 files log

/opt/nginx/sbin/nginx

tail -f \
  /opt/nginx/logs/*.log \
  /var/log/vhost/redmine/*.log \
  /opt/redmine/redmine/log/*.log