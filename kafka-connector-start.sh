#!/bin/sh
KAFKA_HOME=/Users/user/confluent-6.1.0
$KAFKA_HOME/bin/connect-distributed $KAFKA_HOME/etc/kafka/connect-distributed.properties
