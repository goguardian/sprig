#import "SprigPlugin.h"
#if __has_include(<sprig/sprig-Swift.h>)
#import <sprig/sprig-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sprig-Swift.h"
#endif

@implementation SprigPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSprigPlugin registerWithRegistrar:registrar];
}
@end
