#!/usr/bin/env bash

set -xe

podman run \
    --name petclinic \
    --publish 8080:8080 \
    --env JAVA_TOOL_OPTIONS="-javaagent:/workspace/BOOT-INF/lib/cryostat-agent-0.4.0-SNAPSHOT-shaded.jar" \
    --rm \
    quay.io/andrewazores/spring-petclinic-cryostat-agent:latest
