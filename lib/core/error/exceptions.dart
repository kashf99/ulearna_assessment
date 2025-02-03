// exception.dart

class Exceptions implements Exception {
  final String message;
  Exceptions(this.message);

  @override
  String toString() => message;
}

class ServerException extends Exceptions {
  ServerException() : super('Server failure occurred.');
}

class NetworkException extends Exceptions {
  NetworkException() : super('Network failure occurred.');
}
