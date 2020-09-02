#!/bin/bash
set -e

git add '*'
git commit -m $(date +%F-%R)
git push -f origin main
