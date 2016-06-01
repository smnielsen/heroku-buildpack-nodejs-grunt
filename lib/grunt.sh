#!/usr/bin/env bash
run_grunt() {
  if [ -f $build_dir/grunt.js ] || [ -f $build_dir/gruntfile.js ] || [ -f $build_dir/Gruntfile.js ] || [ -f $build_dir/Gruntfile.coffee ]; then
    echo "-----> Found Gruntfile, running grunt heroku task"
    if [ -f $build_dir/node_modules/grunt-cli/bin/grunt ]; then
      $build_dir/node_modules/grunt-cli/bin/grunt heroku
    elif [ -f $build_dir/node_modules/grunt/bin/grunt ]; then
      $build_dir/node_modules/grunt/bin/grunt heroku
    elif [ -f $build_dir/node_modules/.bin/grunt ]; then
      $build_dir/node_modules/.bin/grunt heroku
    else
      info "Could not find grunt executable bin file"
      info "Install dev dependencies for grunt-runnable purpose"
      npm install --dev --quiet --userconfig $build_dir/.npmrc 2>&1 | indent
      info "Installing grunt-cli locally and re-running grunt task"
      npm install grunt-cli
      run_grunt
    fi
  else
    echo "-----> No gruntfile (grunt.js) found"
  fi
}
