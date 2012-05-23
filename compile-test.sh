#!/bin/sh

before() {
  mkdir -p build cache
  cp -r test-app/* build
}

after() {
  rm -rf tmp build
}

compile() {
  : === Compiling
  sh bin/compile build cache 2>&1
  : === Done compiling
}

it_fetches_dart() {
  rm -rf cache
  mkdir cache
  ! test -f cache/dart
  compile
  test -f cache/dart
}

it_skips_dart_fetch_if_exists() {
  test -f cache/dart
  compile | grep "Skipping build"
}

it_deletes_cache() {
  # Here only to delete the cache dir
  rm -rf cache
}
