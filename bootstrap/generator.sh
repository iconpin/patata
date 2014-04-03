#!/bin/bash

PRAC_HOME=$(dirname $0)/..

mkdir -p ${PRAC_HOME}/job_scripts

SCRIPTS_DIR=${PRAC_HOME}/scripts
PATH_TO_RESULTS_DIR=${PRAC_HOME}/results

for BENCHMARK in matmul matmul_ompss
do
    PATH_TO_BENCHMARK_DIR=${PRAC_HOME}
    for NTHREADS in 1 2 4 8 16 24
    do
        sed -e "s|PATH_TO_RESULTS_DIR|${PATH_TO_RESULTS_DIR}|g" ${SCRIPTS_DIR}/template.sh > aux
        sed -e "s|PATH_TO_BENCHMARK_DIR|${PATH_TO_BENCHMARK_DIR}|g" aux > aux2
        sed -e "s|BENCHMARK|${BENCHMARK}|g" aux2 > aux3
        sed -e "s|NTHREADS|${NTHREADS}|g" aux3 > ${PRAC_HOME}/job_scripts/${BENCHMARK}-${NTHREADS}.sh
    done
done

rm aux aux2 aux3
