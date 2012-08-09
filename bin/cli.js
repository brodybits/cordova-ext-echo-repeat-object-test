#!/usr/bin/env node

(function(){
    
    
    var pluginstall = require('pluginstall');
    var pkg = require('../package');
    var fs = require('fs');
    var path = require('path');
    var args = process.argv.slice();
    var firstArgIndex = 0;

    // note: windows expands node to the full node.exe path
    if (args[0] == "node" || args[0].indexOf("node.exe") > 0) {
        firstArgIndex++;
    }

    //args.shift() // skip "cli.js"
    firstArgIndex++;

    //console.log("args.length = " + args.length + " : " + firstArgIndex + " " + args);

    if (args.length == firstArgIndex) {
        console.log('Usage: cordova-ext-echo [platform] [project directory]');
    } 
    else if (args[firstArgIndex] === '-v') {
        console.log('cordova-ext-echo version ' + pkg.version);
    } 
    else {
    
        var platform = args[firstArgIndex];
        var projectDir = args[firstArgIndex+1];
    
    //    console.log("platform = " + platform);
    //    console.log("projectDir = " + projectDir);
    //    console.log('cordova-ext-echo version ' + pkg.version);
    
        var pkgPath = require.resolve(pkg.name); // find yourself little one!
        var extSrcDir = path.join(path.dirname(pkgPath), "src");
    
    //    console.log("extSrcDir = " + extSrcDir);
    
        var config = pluginstall.init(platform, projectDir, extSrcDir);
        var plugin = pluginstall.parseXml(config);

        pluginstall.installPlugin(config, plugin, function (err) {
            if (err) {
                console.error(err);
            } else {
                console.log('plugin installed for platform::' + platform);
            }
        });    
    }

})();
