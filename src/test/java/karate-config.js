//keep this file simple as possible
function fn() {
  //var env = karate.env; // get system property 'karate.env'
  var env = 'dev';
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl:'http://localhost:3000/api/'
  }
  if (env == 'dev') {
    config.userEmail ='karatelove@test.com'
    config.userPassword ='karate123'
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
