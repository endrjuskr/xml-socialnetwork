module.exports = function(grunt) {
  "use strict";

  var path = require("path");
  var cwd = process.cwd();


  var bumpJSON = {
    options: {
      files: ['package.json', 'bower.json'],
      updateConfigs: ['pkg'],
      commit: false,
      createTag: false,
      push: false
    }
  };

  var configJSON = {
    pkg: grunt.file.readJSON("package.json"),
    bump: bumpJSON,
    xml_validator: {
      database: {
        src: [ '*.xml' ]
      },
    }
  };

  grunt.initConfig(configJSON);
  require('load-grunt-tasks')(grunt);
  grunt.registerTask("test", "xml_validator:database");
};
