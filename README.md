# Heroku Buildpack: Dart

This is a Heroku buildpack for [Dart][].

This buildpack requires that you use the
[Cedar-14][cedar14] (Ubuntu 14.x-based) stack for your Heroku application.
If your Heroku app runs on previous versions of Cedar, see below for more info.

## Features

* Runs Dart VM as a server in Heroku's cloud
* Installs packages with [pub][]
* Builds the client app with [pub build][build]
* Cedar 14 (Ubuntu 14) required


## Running on Cedar-10 ?

This buildpack only supports Heroku applications that are running on the
Cedar-14 stack. If your application is running on Cedar-10, you must first
[migrate to Cedar-14][cedar14].

The Cedar-10 stack
on Heroku does not support the Dart SDK by default due to mismatched glibc versions.
If you must remain on the Cedar-10 stack, you need to provide your own .tar.gz of Dart
SDK compiled for Ubuntu 10.04 (Heroku's Cedar stack). Get
[instructions for building Dart for Ubuntu 10.04][buildforubuntu] or you can try
using an (unsupported) [community build of Dart for Ubuntu 10.04][communitybuilds].

## Getting Started

(These instructions assume you have the
[heroku tools](https://toolbelt.heroku.com/) and
[git](http://git-scm.com/) installed, and that you have a heroku
account.)

Create a Heroku app with the _cedar-14_ stack, specify both this buildpack and a
URL to a Dart SDK.

The buildpack currently supports SDKs that are compiled to .zip or .tar.

```bash
$> git clone https://github.com/igrigorik/heroku-buildpack-dart.git
$> mkdir myfirstdartappforheroku
$> cp -R heroku-buildpack-dart/test-app/* myfirstdartappforheroku
$> cd myfirstdartappforheroku
$> git init
$> git add -A .
$> git commit -am "first commit"
$> heroku create myfirstdartappforheroku -s cedar-14
$> heroku config:set DART_SDK_URL=<archive url>
$> heroku config:add BUILDPACK_URL=https://github.com/igrigorik/heroku-buildpack-dart.git
```

Push the app to Heroku. Learn more about [deploying to Heroku with git][deploy].

```bash
$> git push heroku master
```

Example output from a `git push`:

```bash
Initializing repository, done.
Counting objects: 11, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (11/11), 2.27 KiB | 0 bytes/s, done.
Total 11 (delta 0), reused 0 (delta 0)

-----> Fetching custom git buildpack... done
-----> Dart app detected
-----> Welcome, this machine is: Linux 4d4ac1e0-412c-4734-9a68-0e0002f669cf 3.8.11-ec2 #1 SMP Fri May 3 09:11:15 UTC 2013 x86_64 GNU/Linux
-----> Installing Dart VM via URL https://www.dropbox.com/s/y1eq2rkc8j7nyek/dart-sdk-v1.1.0-dev.4.0.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 10.3M  100 10.3M    0     0  5822k      0  0:00:01  0:00:01 --:--:-- 13.4M
-----> Copy Dart binaries to app root
-----> Dart cmd found at -rwx------ 1 u13180 13180 10064032 Dec 22 19:23 /app/dart-sdk/bin/dart
Dart VM version: 1.1.0-dev.4.0 (Mon Dec 16 12:29:42 2013) on "linux_x64"
-----> Dart reports version: 
*** Found pubspec.yaml in /tmp/build_c4247abc-3094-495f-870d-4e72fe1f1f36/.
*** Running pub get
Resolving dependencies.......
Downloading browser 0.9.0...
Downloading http_server 0.9.1...
Downloading mime 0.9.0...
Downloading path 1.0.0...
Got dependencies!
*** Running pub build
Building basic_http_server.......
[Info in Dart2JS]:
Took 0:00:06.587561 to compile basic_http_server|web/index.dart.
Built 8 files!
total
-----> Discovering process types
       Procfile declares types -> (none)

-----> Compressing... done, 10.5MB
-----> Launching... done, v6
       http://myfirstdartappforheroku.herokuapp.com deployed to Heroku

To git@heroku.com:myfirstdartapp2.git
 * [new branch]      master -> master
```

Scale to one web dyno (aka server):

```bash
$> heroku ps:scale web=1
```

Test your app! The URL is printed at the end of the `git push` step.

## Configuration

### Location of Dart SDK

You must specify a URL that points to a .zip that contains the Dart SDK.
Links to Dart SDKs built for Linux are [available][download].

```bash
$> heroku config:set DART_SDK_URL=<archive url>
```

If you are still running on Cedar-10, you will need to build your own Dart SDK
using the [instructions for building Dart SDK for Ubuntu 10.04][buildforubuntu].

### Specifying the script

The `Procfile` defines the file to run when the application starts. We
recommend to put the server script into your application's `bin/` directory.

The sample app's `Procfile` looks like:

```
web: ./dart-sdk/bin/dart bin/basic_http_server.dart
```

### Overriding the build command

By default `pub build` is launched after `pub get`, it can be useful to use
another command: for instance `pub build --mode=debug` or 
`/app/dart-sdk/bin/dart build.dart`:

```bash
$> heroku config:set DART_BUILD_CMD="/app/dart-sdk/bin/dart build.dart"
```

## Example 

See `test-app` directory for the world simplest Dart web app running on
Heroku.

## Learning more

Dart VM can access files, directories, sockets, HTTP, web sockets, SSL, and
more. See the [dart:io library][io] for core functionality.

Dart's package repository, [pub][], hosts lots of options for more
functionality, such as database drivers, HTTP server frameworks, templates,
and more.

## License

The MIT License - Copyright (c) 2012 Ilya Grigorik

[io]: https://api.dartlang.org/docs/channels/stable/latest/dart_io.html
[pub]: http://pub.dartlang.org
[dart]: https://www.dartlang.org
[build]: http://pub.dartlang.org/doc/pub-build.html
[example]: https://github.com/igrigorik/heroku-buildpack-dart/tree/master/test-app
[deploy]: https://devcenter.heroku.com/articles/git
[envcompile]: https://devcenter.heroku.com/articles/labs-user-env-compile
[buildforubuntu]: https://code.google.com/p/dart/wiki/BuildDartSDKOnUbuntu10_04
[communitybuilds]: https://github.com/selkhateeb/heroku-vagrant-dart-build/releases
[cedar14]: https://devcenter.heroku.com/articles/cedar-14-migration
[download]: https://www.dartlang.org/tools/download_archive/
