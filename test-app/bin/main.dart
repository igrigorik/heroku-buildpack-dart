import 'dart:io'
  show Directory, File, HttpHeaders, HttpRequest, HttpServer, Platform;
import 'dart:async' show runZoned;
import 'dart:convert' show JSON;
import 'package:route/server.dart' show Router;

main() {

  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  runZoned(() {
    HttpServer.bind('0.0.0.0', port).then((HttpServer server) {
      print('Server started on port: ${port}');

      new Router(server)
        ..serve('/', method: 'GET').listen(sayHi);
    });
  },
  onError: (e, stackTrace) {
    print('Error: $e $stackTrace');
  });

}

void sayHi(HttpRequest request) {
  var resp = JSON.encode({
    'Dart on Heroku': true,
    'Dart version': Platform.version,
    'Buildpack URL': 'https://github.com/igrigorik/heroku-buildpack-dart',
    'Environment': Platform.environment}
  );
  request.response
    ..headers.set(HttpHeaders.CONTENT_TYPE, 'application/json')
    ..write(resp)
    ..close();
}