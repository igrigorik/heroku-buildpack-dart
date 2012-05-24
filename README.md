# Heroku Buildpack: Dart

This is a Heroku buildpack for [Dart](http://www.dartlang.org/). At the moment Dart is officially [32 bit only](http://code.google.com/p/dart/issues/detail?id=2052), and unfortunately Heroku does not currently provide [support for 32 bit binaries](https://gist.github.com/47b77852c50cb8f57961). Because of this, this buildpack is using a custom / frozen (May 23, 2012) 64 bit build.

## Getting Started

```bash
$> heroku create myapp_name -s cedar
$> heroku config:add BUILDPACK_URL=git@github.com:igrigorik/heroku-buildpack-dart.git

# create your app, see test-app for an example

$> git push heroku master

-----> Heroku receiving push
-----> Fetching custom buildpack... done
-----> Dart app detected
-----> Installing latest Dart VM
-----> Discovering process types
       Procfile declares types -> web
-----> Compiled slug size is 10.5MB
-----> Launching... done, v1

$> curl http://myapp_name.herokuapp.com/
```

See `test-app` directory for the world simplest Dart web app running on Heroku: [dartvm.herokuapp.com](http://dartvm.herokuapp.com/)

## License

The MIT License - Copyright (c) 2012 Ilya Grigorik