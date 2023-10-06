#!/usr/bin/env bash

./mvnw \
  -DskipTests \
  -Dspring-boot.build-image.imageName=quay.io/andrewazores/spring-petclinic-cryostat-agent:latest \
  clean package spring-boot:build-image

podman image prune -f
