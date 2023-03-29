// Autogenerated from Pigeon (v9.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}
static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface MemoryResult ()
+ (MemoryResult *)fromList:(NSArray *)list;
+ (nullable MemoryResult *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation MemoryResult
+ (instancetype)makeWithUsedMemory:(nullable NSNumber *)usedMemory {
  MemoryResult* pigeonResult = [[MemoryResult alloc] init];
  pigeonResult.usedMemory = usedMemory;
  return pigeonResult;
}
+ (MemoryResult *)fromList:(NSArray *)list {
  MemoryResult *pigeonResult = [[MemoryResult alloc] init];
  pigeonResult.usedMemory = GetNullableObjectAtIndex(list, 0);
  return pigeonResult;
}
+ (nullable MemoryResult *)nullableFromList:(NSArray *)list {
  return (list) ? [MemoryResult fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.usedMemory ?: [NSNull null]),
  ];
}
@end

@interface MemoryApiCodecReader : FlutterStandardReader
@end
@implementation MemoryApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [MemoryResult fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface MemoryApiCodecWriter : FlutterStandardWriter
@end
@implementation MemoryApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[MemoryResult class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface MemoryApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation MemoryApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[MemoryApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[MemoryApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *MemoryApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    MemoryApiCodecReaderWriter *readerWriter = [[MemoryApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void MemoryApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<MemoryApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.MemoryApi.getMemoryInfo"
        binaryMessenger:binaryMessenger
        codec:MemoryApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getMemoryInfoWithError:)], @"MemoryApi api (%@) doesn't respond to @selector(getMemoryInfoWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        MemoryResult *output = [api getMemoryInfoWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface MemoryCallbackCodecReader : FlutterStandardReader
@end
@implementation MemoryCallbackCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [MemoryResult fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface MemoryCallbackCodecWriter : FlutterStandardWriter
@end
@implementation MemoryCallbackCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[MemoryResult class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface MemoryCallbackCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation MemoryCallbackCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[MemoryCallbackCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[MemoryCallbackCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *MemoryCallbackGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    MemoryCallbackCodecReaderWriter *readerWriter = [[MemoryCallbackCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

@interface MemoryCallback ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation MemoryCallback

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}
- (void)onReceivedMemoryInfoResult:(MemoryResult *)arg_result completion:(void (^)(FlutterError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.MemoryCallback.onReceivedMemoryInfo"
      binaryMessenger:self.binaryMessenger
      codec:MemoryCallbackGetCodec()];
  [channel sendMessage:@[arg_result ?: [NSNull null]] reply:^(id reply) {
    completion(nil);
  }];
}
@end
