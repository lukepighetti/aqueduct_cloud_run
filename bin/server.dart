import 'package:cloud_run_app/cloud_run_app.dart';

Future main() async {
  /// 1. Setup support for $PORT environment variable
  final port = int.parse(Platform.environment["PORT"] ?? "8888");

  final app = Application<CloudRunAppChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = port;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
