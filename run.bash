#!/usr/bin/env bash

set -xe

basedir="$(dirname -- "$0")"

extras_volume="spring_petclinic_demo"
teardown() {
  if podman volume exists "${extras_volume}"; then
    podman volume rm -f "${extras_volume}"
  fi
  rm -f "${tmp}"
}
teardown
trap teardown EXIT


vol="$(podman volume create "${extras_volume}")"
tmp="$(mktemp)"
tar cf "${tmp}" "${basedir}/"extras/*.jar
podman volume import "${vol}" "${tmp}"

podman run \
    --name petclinic \
    --publish 8080:8080 \
    --volume "${extras_volume}":/mnt/ \
    --env JAVA_TOOL_OPTIONS="-javaagent:/mnt/extras/cryostat-agent-0.3.0-SNAPSHOT.jar" \
    --rm \
    docker.io/library/spring-petclinic:3.1.0-SNAPSHOT
