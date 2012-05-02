# Heroku Buildpack: Dart

*Work in progress*

This is a Heroku buildpack for [Dart](http://www.dartlang.org/). Status:

- https://gist.github.com/299535bbf56bf3016cba
- http://code.google.com/p/dart/issues/detail?id=2052

TL;DR: Dart is 32 bit only at the moment, Heroku doesn't play well with 32 bit binaries.

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

## License

The MIT License - Copyright (c) 2012 Ilya Grigorik