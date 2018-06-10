#!/usr/bin/env bash

HTTP_PORT=9999
CLUSTER_NAME=HenryWu
BACKUP_DIR=/var/lib/aurora
ZK_ENDPOINTS=u3:2181,u4:2181,u5:2181
SERVERSET_PATH=/aurora/scheduler
REPLICATED_LOG=/var/db/aurora
MESOS_MASTER_ADDRESS=u3
NATIVE_LOG_ZK_PATH=/aurora/replicated-log
NATIVE_LOG_QUORUM=2

JAVA_OPTS="-mx2g -ms2g -Djava.library.path=/opt/share/aurora/lib"
MESOS_NATIVE_LIBRARY="/opt/share/mesos/lib/libmesos.so"

./aurora-scheduler \
    -http_port=${HTTP_PORT} \
    -cluster_name=${CLUSTER_NAME} \
    -backup_dir=${BACKUP_DIR} \
    -zk_endpoints=${ZK_ENDPOINTS} \
    -serverset_path=$SERVERSET_PATH \
    -native_log_file_path=${REPLICATED_LOG} \
    -native_log_zk_group_path=${NATIVE_LOG_ZK_PATH} \
    -native_log_quorum_size=${NATIVE_LOG_QUORUM} \
    -mesos_master_address=${MESOS_MASTER_ADDRESS}


#    -thermos_executor_path=/usr/bin/thermos_executor \
#    -allowed_container_types="MESOS,DOCKER" \
#    -thermos_executor_flags="--announcer-enable --announcer-ensemble=10.12.4.7:2181" \
#    -vlog="INFO"
