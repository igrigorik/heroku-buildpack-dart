# Heroku Buildpack: Dart

This is a Heroku buildpack for [Dart](http://www.dartlang.org/).

Installation of packages through [pub](http://pub.dartlang.org/) is supported.

A Dart build script (build.dart) will be executed if found.

*NOTE*: The current official builds of Dart SDK do not support Heroku, due to
mismatched glibc versions. You need to provide your own .tar.gz of Dart SDK,
compiled for Ubuntu 10.04 (Heroku's Cedar stack). Get [instructions for
building Dart for Ubuntu 10.04][instructions].

## Getting Started

```bash
$> heroku create myapp_name -s cedar
$> heroku labs:enable user-env-compile
$> heroku config:set DART_SDK_URL=<archive url>
$> heroku config:add BUILDPACK_URL=https://github.com/igrigorik/heroku-buildpack-dart.git

# create your app, see test-app for an example

$> git push heroku master

Counting objects: 7, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (7/7), 1008 bytes, done.
Total 7 (delta 0), reused 0 (delta 0)

-----> Fetching custom git buildpack... done
-----> Dart app detected
-----> Welcome, this machine is: Linux 2704a4f7-0e7d-4eef-83e7-39833c31aa74 3.8.11-ec2 #1 SMP Fri May 3 09:11:15 UTC 2013 x86_64 GNU/Linux
-----> Installing Dart VM via URL <YOUR ARCHIVE URL>
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 10.2M  100 10.2M    0     0  4122k      0  0:00:02  0:00:02 --:--:-- 4150k
-----> Copy Dart binaries to app root
-----> Dart cmd found at -rwx------ 1 u54109 54109 10539520 Oct 27 01:49 /app/dart-sdk/bin/dart
Dart VM version: 0.8.6.0_r29156_sethladd (Sat Oct 26 18:36:05 2013) on "linux_x64"
-----> Dart reports version: 
-----> Install packages
*** Found pubspec.yaml in .
Resolving dependencies............
Downloading route 0.4.5+1 from hosted...
Downloading path 0.8.6 from hosted...
Downloading http_server 0.8.6 from hosted...
Downloading browser 0.8.6 from hosted...
Downloading logging 0.8.6 from hosted...
Downloading mime 0.8.6 from hosted...
Got dependencies!
-----> Discovering process types
       Procfile declares types -> web

-----> Compiled slug size: 10.3MB
-----> Launching... done, v7
       http://dart-server-test.herokuapp.com deployed to Heroku

To git@heroku.com:dart-server-test.git
 * [new branch]      master -> master


$> curl http://myapp_name.herokuapp.com/
```

## Example 

See `test-app` directory for the world simplest Dart web app running on Heroku: [http://dart-server-test.herokuapp.com/](http://dart-server-test.herokuapp.com/)

## License

The MIT License - Copyright (c) 2012 Ilya Grigorik


[instructions]: https://code.google.com/p/dart/wiki/BuildDartSDKOnUbuntu10_04
