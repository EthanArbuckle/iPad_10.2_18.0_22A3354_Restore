@implementation MSDOSFeatureFlags

+ (BOOL)isPressDemoModeEnabled
{
  return _os_feature_enabled_impl("MobileStoreDemo", "PressDemoMode");
}

@end
