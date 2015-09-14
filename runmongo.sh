#!/bin/bash
docker run --rm -ti \
    -v /opt/data/mongo:/data/db \
    vertigo/mongo

