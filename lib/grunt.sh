run_grunt() {
  if [ -f $build_dir/grunt.js ] || [ -f $build_dir/gruntfile.js ] || [ -f $build_dir/Gruntfile.js ] || [ -f $build_dir/Gruntfile.coffee ]; then
    echo "-----> Found Gruntfile, running grunt heroku task"
    if [ -f $build_dir/node_modules/grunt-cli/bin/grunt ]; then
      $build_dir/node_modules/grunt-cli/bin/grunt heroku
    elif [ -f $build_dir/node_modules/grunt/bin/grunt ]; then
      $build_dir/node_modules/grunt/bin/grunt heroku
    else
      echo "       Could not find local grunt, force install..."
      npm install grunt
      $build_dir/node_modules/grunt/bin/grunt heroku
    fi
  else
    echo "-----> No gruntfile (grunt.js) found"
  fi
}
