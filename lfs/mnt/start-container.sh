#!/bin/bash
# Copyright (c) 2016-2018 Accupara Inc. All rights reserved

## run first time only.
# docker build -t bmu-lfs .

## Start docker container
docker run --name bmu-lfs -v /home/abhijit/mnt/:/mnt -t -i bmu-lfs /bin/bash
