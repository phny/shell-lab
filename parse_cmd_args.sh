#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--start)
    START="$2"
    shift # past argument
    shift # past value
    ;;
    -k|--stop)
    STOP="$2"
    shift # past argument
    shift # past value
    ;;
    -d|--default)
    DEFAULT=start
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if test "$START" = 'start'
then 
    echo "Starting RTC-Core" 
    # 启动RTC-Core
    nohup python examples/rtcs/rtc-core.py -c examples/rtcs/config/real-time_config.yaml >/dev/null 2>&1 &
    echo "RTC-Core started"
    sleep 5
    # 启动RTCS
    echo "Starting RTCS"
    nohup python examples/rtcs/rtcs.py -c examples/rtcs/config/real-time_config.yaml >/dev/null 2>&1 &
    sleep 5
    echo "RTCS started"
fi;

if test "$STOP" = 'stop'
then 
    pgrep -f grpc_rtcs_clustering | xargs -i kill -s 15 {}
    pgrep -f grpc_rtc_core_clustering | xargs -i kill -s 15 {}
    sleep 5
    echo "RTCS service stop"
fi;
