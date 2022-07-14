#!/usr/bin/env bash
set -euo pipefail

readonly SELF_PATH="$(cd "$(dirname "${0}")" && pwd)"
readonly SRC_PATH="${SELF_PATH}/../src"
readonly EXAMPLE_PATH="${SELF_PATH}/../example"

readonly IMAGE_NAME=thomvaill/makedockfile-test
readonly CONTAINER_NAME=thomvaill_makedockfile-test

test_build () {
    local result

    make build

    result="$(docker image ls)"
    assertContains "Image should appear in docker image ls" "${result}" "${IMAGE_NAME}"
}

test_up () {
    local result

    make up
    sleep 1

    result="$(curl -q http://localhost:4242/)"
    assertContains "cURL should return Hello World" "${result}" "Hello World"
}

test_tests () {
    local result
    result="$(make test)"
    assertContains "Tests should pass" "${result}" "1 passing"
}

# *** common functions
clean () {
    docker container stop "${CONTAINER_NAME}" &> /dev/null || true
    docker container rm "${CONTAINER_NAME}" &> /dev/null || true
    docker image rm "${IMAGE_NAME}" &> /dev/null || true
}

# *** shunit2
oneTimeSetUp () {
    cp "${SRC_PATH}/Makefile" "${EXAMPLE_PATH}"

    clean
}

setUp () {
    cd "${EXAMPLE_PATH}"
}

tearDown () {
    clean
}

oneTimeTearDown () {
    rm -f "${EXAMPLE_PATH}/Makefile"
}

# shellcheck source=scripts/tests/shunit2.sh
source "${SELF_PATH}/shunit2.sh"
