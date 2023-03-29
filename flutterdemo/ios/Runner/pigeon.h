// Autogenerated from Pigeon (v9.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class MemoryResult;

@interface MemoryResult : NSObject
+ (instancetype)makeWithUsedMemory:(nullable NSNumber *)usedMemory;
@property(nonatomic, strong, nullable) NSNumber * usedMemory;
@end

/// The codec used by MemoryApi.
NSObject<FlutterMessageCodec> *MemoryApiGetCodec(void);

@protocol MemoryApi
/// @return `nil` only when `error != nil`.
- (nullable MemoryResult *)getMemoryInfoWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void MemoryApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<MemoryApi> *_Nullable api);

/// The codec used by MemoryCallback.
NSObject<FlutterMessageCodec> *MemoryCallbackGetCodec(void);

@interface MemoryCallback : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)onReceivedMemoryInfoResult:(MemoryResult *)result completion:(void (^)(FlutterError *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END
