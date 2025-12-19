#!/usr/bin/env bash

rm -rf src-tauri/target
docker build -t tauriv2:ubuntu .
docker run -it --rm -v $PWD:/src tauriv2:ubuntu