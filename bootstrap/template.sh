#!/bin/bash

#@job_name          = BENCHMARK-NTHREADS
#@output            = BENCHMARK-NTHREADS.out
#@error             = BENCHMARK-NTHREADS.err
#@total_tasks       = 1
#@cpus_per_task     = 12
#@tasks_per_node    = 1
#@wall_clock_limit  = 00:10:00

INITIAL_DIR=`pwd`
RESULTS_DIR=PATH_TO_RESULTS_DIR

## Bring and compile benchmark in the local hard drive
cd ${TMPDIR}
cp -r PATH_TO_BENCHMARK_DIR benchmark_dir
cd benchmark_dir
make

## Execute benchmark
./BENCHMARK NTHREADS

## Move results and output files to the results directory
mkdir -p ${RESULTS_DIR}
mv ${INITIAL_DIR}/BENCHMARK-NTHREADS.out ${RESULTS_DIR}
mv ${INITIAL_DIR}/BENCHMARK-NTHREADS.err ${RESULTS_DIR}
