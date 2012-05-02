before() {
  cp -r test-app detect-test
}

after() {
  rm -rf detect-test
}

it_is_go_if_dart_files_under_src() {
  sh -x bin/detect detect-test/
}

it_is_not_go_without_all_sh_or_dart_files() {
  rm -rf detect-test/src/*
  ! sh -x bin/detect detect-test/
}
