#!/bin/bash

CM_VERSION="5.16.1"

/opt/cm-${CM_VERSION}/etc/init.d/cloudera-scm-agent stop
sid=$(ps ajx | grep cmf-listener | grep -v grep | awk '{print $4}')
if [[ x"$sid" != "x" ]]; then
    pkill -9 -s $sid
    sleep 2
fi
umount /opt/cm-${CM_VERSION}/run/cloudera-scm-agent/process 2>/dev/null
rm -rf /opt/cm-${CM_VERSION}/run/cloudera-scm-agent/

rm -rf /opt/cm-${CM_VERSION}/lib/cloudera-scm-agent/
mkdir -p /opt/cm-${CM_VERSION}/lib/cloudera-scm-agent/
