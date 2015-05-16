#!/bin/bash

set -e

cd seam-carving-code

RUN_CMD="./target/release/2-seam-carving ../../seam-carving-code/test-input.png -W"

COUNTER=0
for COMMIT in $(git rev-list --reverse master)
do
    COMMIT_DESC=$(git show $COMMIT --oneline --no-patch)
    COMMIT_DIR="../results/$COUNTER-$(echo $COMMIT_DESC | tr ' ' '-')"
    echo "*** Benchmarking $COMMIT_DESC and storing results in $COMMIT_DIR"
    echo "** Grabbing files"
    git checkout $COMMIT
    mkdir -p $COMMIT_DIR
    cp -r Cargo.toml Cargo.lock src $COMMIT_DIR
    cd $COMMIT_DIR
    echo "** Building..."
    cargo build --release
    echo "** Timing run"
    /usr/bin/time -v -o time-output.txt $RUN_CMD 300
    echo "** Perf record run"
    perf record $RUN_CMD 300
    echo "** Callgrind run"
    valgrind --tool=callgrind --callgrind-out-file=callgrind.out $RUN_CMD 100
    cd -
    let COUNTER=COUNTER+1
done

git checkout master

