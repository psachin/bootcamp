#!/usr/bin/env bash

echo "Cleaning up containers and objects"
swift delete current
swift delete archive
