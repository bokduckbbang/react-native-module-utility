#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ModuleUtility, NSObject)

RCT_EXTERN_METHOD(exitApp)
RCT_EXTERN_METHOD(feedback)

RCT_EXTERN_METHOD(beginBackgroundTask: (RCTPromiseResolveBlock) resolve
                                        withRejecter:(RCTPromiseRejectBlock) reject)
RCT_EXTERN_METHOD(endBackgroundTask:  (NSInteger) identifier 
                                        withResolver:(RCTPromiseResolveBlock) resolve
                                         withRejecter:(RCTPromiseRejectBlock) reject)
RCT_EXTERN_METHOD(requestTrackingPermission)
RCT_EXTERN_METHOD(version: (RCTPromiseResolveBlock) resolve
                            withRejecter:(RCTPromiseRejectBlock) reject)

RCT_EXTERN_METHOD(getDeviceId: (RCTPromiseResolveBlock) resolve
                                        withRejecter:(RCTPromiseRejectBlock) reject)

RCT_EXTERN_METHOD(getModelId: (RCTPromiseResolveBlock) resolve
                                        withRejecter:(RCTPromiseRejectBlock) reject)

RCT_EXTERN_METHOD(getOs: (RCTPromiseResolveBlock) resolve
                                        withRejecter:(RCTPromiseRejectBlock) reject)
@end
