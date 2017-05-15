module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    name: "simditor-devices"

    coffee:
      src:
        options:
          bare: true
        files:
          'lib/<%= name %>.js': 'src/<%= name %>.coffee'
    sass:
      src:
        options:
          style: 'expanded'
          bundleExec: true
          sourcemap: 'none'
        files:
          'styles/<%= name %>.css': 'styles/<%= name %>.scss'

    watch:
      scripts:
        files: ['src/**/*.coffee']
        tasks: ['coffee:src']
      styles:
        files: ['styles/*.scss']
        tasks: ['sass:src']

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['sass', 'coffee', 'watch']
  grunt.registerTask 'test', ['sass', 'coffee']
