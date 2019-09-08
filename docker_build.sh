#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
docker run -v $DIR:/repo --rm safijari/manylinux2010-x64 /repo/build.sh
