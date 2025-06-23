#!/bin/bash

# todo write in more to automate getting the vJunos image
images=(
  "ubuntu:24.04"
)

for img in "${images[@]}"; do
  docker pull "$img"
done