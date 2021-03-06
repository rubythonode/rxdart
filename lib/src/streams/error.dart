import 'dart:async';

/// Returns an observable sequence that terminates with an exception, then
/// immediately completes.
///
/// The error operator is one with very specific and limited behavior. It is
/// mostly useful for testing purposes.
///
/// ### Example
///
///     new ErrorStream(new ArgumentError());
class ErrorStream<T> extends Stream<T> {
  final Object error;

  ErrorStream(this.error);

  @override
  StreamSubscription<T> listen(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) {
    // ignore: close_sinks
    StreamController<T> controller = new StreamController<T>();

    controller.addError(error);

    controller.close();

    return controller.stream.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}
