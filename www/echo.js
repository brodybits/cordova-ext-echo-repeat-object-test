var exec = cordova.require('cordova/exec');

var Echo = function(){

};

Echo.echo = function(str, callback) {
  exec(callback, function(err) {
      callback('Nothing to echo.');
  }, "Echo", "echo", [str]);
};

Echo.array_object_count = function(array, callback) {
  exec(function(r) { callback(r[0].count); }, function(err) {
      callback('Nothing to count.');
  }, "Echo", "array_object_count", array);
};

Echo.repeat_it = function(it, count, callback) {
  exec(callback, function(err) {
      callback('Nothing to repeat.');
  }, "Echo", "repeat_it", [it, {count: count}]);
};

Echo.build_test = function(count, callback) {
  exec(callback, function(err) {
      callback('Nothing to repeat.');
  }, "Echo", "build_test", [{count: count}]);
};

module.exports = Echo;
