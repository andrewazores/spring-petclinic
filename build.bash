#!/usr/bin/env bash

./mvnw -DskipTests clean package spring-boot:build-image ; podman image prune -f
