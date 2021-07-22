#!/usr/bin/env bash
git describe --tags `git rev-list --tags --max-count=1` || git rev-parse HEAD
