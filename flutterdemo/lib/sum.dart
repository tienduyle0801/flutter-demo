// Autogenerated from Pigeon (v9.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class SumRequest {
  SumRequest({
    this.a,
    this.b,
  });

  int? a;

  int? b;

  Object encode() {
    return <Object?>[
      a,
      b,
    ];
  }

  static SumRequest decode(Object result) {
    result as List<Object?>;
    return SumRequest(
      a: result[0] as int?,
      b: result[1] as int?,
    );
  }
}

class SumReply {
  SumReply({
    this.result,
  });

  int? result;

  Object encode() {
    return <Object?>[
      result,
    ];
  }

  static SumReply decode(Object result) {
    result as List<Object?>;
    return SumReply(
      result: result[0] as int?,
    );
  }
}

class _SumApiCodec extends StandardMessageCodec {
  const _SumApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SumReply) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is SumRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return SumReply.decode(readValue(buffer)!);
      case 129: 
        return SumRequest.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class SumApi {
  /// Constructor for [SumApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  SumApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _SumApiCodec();

  Future<SumReply?> sum(SumRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SumApi.sum', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_request]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as SumReply?);
    }
  }
}