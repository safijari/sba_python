#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
sudo docker build --no-cache -t sba_builder .
sudo docker run -v $DIR:/repo -v /home/lex/Downloads/eigen-3.3.3:/eigenfolder --rm sba_builder /repo/build.sh
