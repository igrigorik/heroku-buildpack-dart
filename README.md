# Heroku Buildpack: Dart

This is a Heroku buildpack for [Dart](http://www.dartlang.org/).

## Getting Started

```bash
$> heroku create myapp_name -s cedar
$> heroku config:add BUILDPACK_URL=https://github.com/igrigorik/heroku-buildpack-dart.git

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