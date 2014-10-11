import 'dart:io' show File, HttpServer, Platform;
import 'dart:async' show runZoned;
import 'package:http_server/http_server.dart' show VirtualDirectory;
import 'package:path/path.dart' show join, dirname;

void main() {
  // Assumes the server lives in bin/ and that `pub build` ran
  var pathToBuild = join(dirname(Platform.script.toFilePath()), '..', 'build/web');

  var staticFiles = new VirtualDirectory(pathToBuild);
  staticFiles.allowDirectoryListing = true;
  staticFiles.directoryHandler = (dir, request) {
    // Redirect directory-requests to index.html files.
    var indexUri = new Uri.file(dir.path).resolve('index.html');
    staticFiles.serveFile(new File(indexUri.toFilePath()), request);
  };

  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  runZoned(() {
    HttpServer.bind('0.0.0.0', port).then((server) {
      server.listen(staticFiles.serveRequest);
    });
  },
  onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
}
