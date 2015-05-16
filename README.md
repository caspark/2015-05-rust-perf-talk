Rust Talk in May 2015
=====================

Assuming you have [the code](https://github.com/caspark/2015-05-rust-perf-talk-code) checked out as `seam-carving-code`, run `./run-benchmarks.sh` to generate a bunch of timing and profiling results using `perf` and [Valgrind's callgrind](http://valgrind.org/docs/manual/cl-manual.html).

For each commit in the code directory, you'll get 1 result directory in `results/`.

Use `grep -r wall results` to see the timing info, `perf report` when in a particular result dir to interpret the perf data, and `kcachegrind results/<some-result>/<callgrind.out` to inspect the callgrind report.

