import 'package:pigeon/pigeon.dart';

class SumRequest {
  int? a;
  int? b;
}

class SumReply {
  int? result;
}

@HostApi()
abstract class SumApi {
  SumReply? sum(SumRequest request);
}
