#!/usr/bin/env bash

set -xe

podman run \
    --name petclinic \
    --publish 8080:8080 \
    --env JAVA_TOOL_OPTIONS="-javaagent:/workspace/BOOT-INF/lib/cryostat-agent-0.4.0-SNAPSHOT-shaded.jar" \
    --rm \
    docker.io/library/spring-petclinic:3.1.0-SNAPSHOT
