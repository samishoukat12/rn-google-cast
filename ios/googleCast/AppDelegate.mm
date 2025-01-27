#import "AppDelegate.h"
// @generated begin react-native-google-cast-import - expo prebuild (DO NOT MODIFY) sync-da0acf16745f87cea5bffba9c0cc3a4f5e4387ea
#if __has_include(<GoogleCast/GoogleCast.h>)
#import <GoogleCast/GoogleCast.h>
#endif
// @generated end react-native-google-cast-import

#import <React/RCTBundleURLProvider.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

#if __has_include(<GoogleCast/GoogleCast.h>)
  NSString *receiverAppID = kGCKDefaultMediaReceiverApplicationID;
  GCKDiscoveryCriteria *criteria = [[GCKDiscoveryCriteria alloc] initWithApplicationID:receiverAppID];
  GCKCastOptions* options = [[GCKCastOptions alloc] initWithDiscoveryCriteria:criteria];
  options.disableDiscoveryAutostart = true;
  options.startDiscoveryAfterFirstTapOnCastButton = true;
  options.suspendSessionsWhenBackgrounded = true;
  [GCKCastContext setSharedInstanceWithOptions:options];
  [GCKCastContext sharedInstance].useDefaultExpandedMediaControls = true;
#endif
// @generated end react-native-google-cast-didFinishLaunchingWithOptions

  self.moduleName = @"googleCast";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
