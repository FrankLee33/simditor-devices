module.exports = (grunt)->
  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json'),
    coffee:
      compile:
        files:
          "lib/simditor-devices.js":"src/simditor-devices.coffee"
  )
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.registerTask 'default', ['coffee:compile']
