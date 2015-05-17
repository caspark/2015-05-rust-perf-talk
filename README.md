Rust Talk in May 2015
=====================

Viewing the slides
------------------

```
cd reveal.js
npm install
grunt serve # hit s in the browser to view speaker notes
```

or 

open `reveal.js/index.html` in your browser (speaker notes won't work)

or

read `reveal.js/index.html` with a text editor and mentally add in the pretty pictures.

Note: this copy of reveal.js has a tweak to make the speaker notes use `white-space: pre-line` so that line breaks are preserved. Other than that, only `index.html` and `img/` + its contents are unique to this repo.

Running benchmarks
------------------
Assuming you have [the code](https://github.com/caspark/2015-05-rust-perf-talk-code) checked out as `seam-carving-code`, run `./run-benchmarks.sh` to generate a bunch of timing and profiling results using `perf` and [Valgrind's callgrind](http://valgrind.org/docs/manual/cl-manual.html).

For each commit in the code directory, you'll get 1 result directory in `results/`.

Use `grep -r wall results` to see the timing info, `perf report` when in a particular result dir to interpret the perf data, and `kcachegrind results/<some-result>/<callgrind.out` to inspect the callgrind report.

