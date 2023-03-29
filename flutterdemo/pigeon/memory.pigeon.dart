import 'package:pigeon/pigeon.dart';

class MemoryResult {
  double? usedMemory;
}

@HostApi()
abstract class MemoryApi {
  MemoryResult getMemoryInfo();
}

@FlutterApi()
abstract class MemoryCallback {
  void onReceivedMemoryInfo(MemoryResult result);
}
