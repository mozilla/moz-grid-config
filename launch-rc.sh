#!/bin/bash
echo -n -e "\033]0;Selenium RC [$1] [$2]\007"
ant launch-remote-control -Drc.port=$1 -Drc.environment="$2"
