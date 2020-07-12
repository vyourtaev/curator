#!/bin/bash

cron -f -l -L 8 && tail -f /var/log/cron.log
