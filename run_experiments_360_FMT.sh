#!/bin/bash

cd build;


datasets=( aces fr079 intel mit_csail mit_killian )
dsizes=( 7373 4933 13630 1987 17479 )


for d in "${!datasets[@]}"
do
  echo "${dsizes[d]}"

  reset; make && ./s2msm_node 1 1 0 "${dsizes[d]}" 0.2 0.786 0.03 0.00 0 0 360 180 FMT "${datasets[d]}" 360 &
  reset; make && ./s2msm_node 1 1 0 "${dsizes[d]}" 0.2 0.786 0.03 0.05 0 0 360 180 FMT "${datasets[d]}" 360

done
