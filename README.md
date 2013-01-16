# Heroku Buildpack: Dart

This is a Heroku buildpack for [Dart](http://www.dartlang.org/).

Installation of packages through [pub](http://pub.dartlang.org/) is supported.

## Getting Started

```bash
$> heroku create myapp_name -s cedar
$> heroku config:add BUILDPACK_URL=https://github.com/igrigorik/heroku-buildpack-dart.git

# create your app, see test-app for an example

$> git push heroku master

-----> Heroku receiving push
-----> Fetching custom buildpack... done
-----> Dart app detected
-----> Installing Dart VM, build: latest
-----> Copy Dart binaries to app root
-----> Install packages
.
[...]
.
-----> Discovering process types
       Procfile declares types -> web
-----> Compiled slug size is 10.5MB
-----> Launching... done, v1

$> curl http://myapp_name.herokuapp.com/
```

## Configuration

#### Build Version

You can specify the version of the dart-sdk that should be used by

```bash
$> heroku config:set BUILD=<version number>
```

A list of versions can be found [here](http://commondatastorage.googleapis.com/dart-editor-archive-integration/latest/changelog.html), by default `latest` is chosen. 

#### Archive Location

The build archive location can be modified to choose between [continuous](http://commondatastorage.googleapis.com/dart-editor-archive-continuous) or [integration](http://commondatastorage.googleapis.com/dart-editor-archive-integration), by default integration archive is chosen. 

```bash
$> heroku config:set ARCHIVE=<archive url>
```

#### Enable ENV Variables

In order for the build version or archive to come through in to the build pack you also need to set an experimental flag on Heroku

```bash
$> heroku labs:enable user-env-compile
```
More info on that can be found in [Heroku's Devcenter: Heroku Labs: user-env-compile](https://devcenter.heroku.com/articles/labs-user-env-compile)

## Example 

See `test-app` directory for the world simplest Dart web app running on Heroku: [dartvm.herokuapp.com](http://dartvm.herokuapp.com/)

## License

The MIT License - Copyright (c) 2012 Ilya Grigorik