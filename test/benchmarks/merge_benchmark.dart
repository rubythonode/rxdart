import 'dart:async';

import 'package:benchmark_harness/benchmark_harness.dart';

import 'package:rxdart/rxdart.dart';

import 'benchmark_utils.dart';

void main() => MergeBenchmark.main();

class MergeBenchmark extends BenchmarkBase {
  MergeBenchmark() : super("merge");

  static void main() => new MergeBenchmark().report();

  @override
  void run() {
    new Observable<int>.merge(<Stream<int>>[range(), range()]).listen(null);
  }
}
