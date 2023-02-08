#!/usr/bin/env bash 

pushd uptrace 
./uptrace --config uptrace.yml ch reset
./uptrace --config uptrace.yml serve
