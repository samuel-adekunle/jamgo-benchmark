#!/bin/bash

set -e

rm -rf public/

rm -rf pages/index/index.so

rm -rf pages/index_*

for i in {1..99}; do
  jamgo new page index_$i
  cp pages/index/index.go pages/index_$i/index_$i.go
  cp pages/index/index.gohtml pages/index_$i/index_$i.gohtml
done

{
  time jamgo build
} 2>out.txt
