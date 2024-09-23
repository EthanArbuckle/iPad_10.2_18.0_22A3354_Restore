@implementation VSFeatureFlags

+ (BOOL)isTrialEnabled
{
  return 1;
}

+ (BOOL)isLowPowerDeviceNeuralEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)useSiriTTSService
{
  return _os_feature_enabled_impl();
}

+ (BOOL)useSiriTTSServiceV2
{
  return _os_feature_enabled_impl();
}

+ (BOOL)lowInactiveMemory
{
  return _os_feature_enabled_impl();
}

@end
